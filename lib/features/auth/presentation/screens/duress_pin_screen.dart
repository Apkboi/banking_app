import 'dart:developer';

import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/auth/presentation/blocs/auth_blocs/auths_bloc.dart';
import 'package:banking_app/features/auth/presentation/blocs/auth_blocs/auths_bloc.dart';
import 'package:banking_app/features/auth/presentation/screens/set_passcode_screen.dart';
import 'package:banking_app/features/auth/presentation/widgets/dialogs/auth_error_dialog.dart';
import 'package:banking_app/features/auth/presentation/widgets/pin_view.dart';
import 'package:banking_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';

enum TransactionPinMode { normal, confirm, retry }

class DuressPinScreen extends StatefulWidget {
  const DuressPinScreen({Key? key}) : super(key: key);

  @override
  State<DuressPinScreen> createState() => _DuressPinScreenState();
}

class _DuressPinScreenState extends State<DuressPinScreen> {
  final _pinController = PINController();
  TransactionPinMode pinMode = TransactionPinMode.normal;
  String pin = '';
  String confirmPin = '';
  final bloc = injector.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppUtils.showConfirmDialog(context);
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocListener<AuthBloc, AuthState>(
            bloc: bloc,
            listener: _listenToDuressPinState,
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'NOTE : You can use this pin when ever you are in a duress condition to transfer your funds to suspense account',
                  style: TextStyle(color: Colors.orange),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Image.asset('assets/gif/login_emoji.gif'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(getHintText()),
                      const SizedBox(
                        height: 20,
                      ),
                      PinView(
                          onDigitPressed: (int) {},
                          onDelete: () {},
                          onDone: (val) {
                            _processPin(val);
                          },
                          pinController: _pinController),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),

                // CustomButton(child: const Text('Set Pin'), onPressed: () {}),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _processPin(String value) {
    if (pinMode == TransactionPinMode.normal) {
      _pinController.resetPin();
      pin = value;
      pinMode = TransactionPinMode.confirm;
    } else if (pinMode == TransactionPinMode.retry) {
      pin = '';
      confirmPin = '';
      pinMode = TransactionPinMode.normal;
    } else if (pinMode == TransactionPinMode.confirm) {
      confirmPin = value;
      if (pin == confirmPin) {
        _pinController.resetPin();

        bloc.add(SetDuressPinEvent(duressPin: pin));
      } else {
        _pinController.resetPin();
        pin = '';
        confirmPin = '';
        pinMode = TransactionPinMode.normal;
        AppUtils.showCustomToast("Pin does not match");
        setState(() {});
      }
    }
    setState(() {
      log("MODE: $pinMode");
      log("PIN: $pin");
      log("Confirm Pin: $confirmPin");
    });
  }

  String getHintText() {
    if (pinMode == TransactionPinMode.normal) {
      return 'Enter Duress Pin ';
    } else if (pinMode == TransactionPinMode.confirm) {
      return 'Confirm Duress Pin';
    } else if (pinMode == TransactionPinMode.retry) {
      return 'Enter Duress Pin';
    } else {
      return 'Enter Duress Pin';
    }
  }

  void _listenToDuressPinState(BuildContext context, AuthState state) {
    if (state is SetDuressPinLoadingState) {
      AppUtils.showAnimatedProgressDialog(context);
    }
    if (state is SetDuressPinSuccessState) {
      CustomSnackBar.showMessage(context,
          message: 'Duress pin has been set successfully 💪🏿 ',
          backgroundColor: Colors.green);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const SetPasscodeScreen(),
      ));
    }
    if (state is AuthFailureState) {
      _pinController.resetPin();
      pin = '';
      confirmPin = '';
      pinMode = TransactionPinMode.normal;
      Navigator.pop(context);
      CustomSnackBar.show(context, body: AuthErrorDialog(errors: state.errors));
    }
  }
}
