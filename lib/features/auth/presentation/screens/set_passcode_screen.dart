import 'dart:developer';

import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/auth/presentation/blocs/auth_blocs/auths_bloc.dart';
import 'package:banking_app/features/auth/presentation/widgets/dialogs/auth_error_dialog.dart';
import 'package:banking_app/features/auth/presentation/widgets/pin_view.dart';
import 'package:banking_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum TransactionPinMode { normal, confirm, retry }

class SetPasscodeScreen extends StatefulWidget {
  const SetPasscodeScreen({Key? key}) : super(key: key);

  @override
  State<SetPasscodeScreen> createState() => _SetPasscodeScreenState();
}

class _SetPasscodeScreenState extends State<SetPasscodeScreen> {
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
        // appBar: AppBar(
        //   title: Row(
        //     children: [
        //       LineIcon.lock(),
        //       const SizedBox(
        //         width: 10,
        //       ),
        //       const Text('Set Transaction Pin'),
        //     ],
        //   ),
        //   elevation: 0,
        // ),
        body: BlocListener<AuthBloc, AuthState>(
          bloc: bloc,
          listener: _listenToPasscodeState,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  'NOTE : This pin will be used to authorize you before accesing the app.',
                  style: TextStyle(color: Colors.purple),
                ),
                const SizedBox(
                  height: 25,
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
                          onDigitPressed: (pin) {},
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

        bloc.add(SetPasscodeEvent(passcode: pin));
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
      return 'Enter Passcode ';
    } else if (pinMode == TransactionPinMode.confirm) {
      return 'Confirm Passcode';
    } else if (pinMode == TransactionPinMode.retry) {
      return 'Enter Passcode';
    } else {
      return 'Enter Passcode ';
    }
  }

  void _listenToPasscodeState(BuildContext context, AuthState state) {
    if (state is SetPasscodeLoadingState) {
      AppUtils.showAnimatedProgressDialog(context);
    }
    if (state is SetPasscodeSuccessState) {
      CustomSnackBar.showMessage(context,
          message: 'Passcode has been set successfully 💪🏿 ',
          backgroundColor: Colors.green);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
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
