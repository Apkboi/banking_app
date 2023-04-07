import 'dart:developer';

import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/auth/presentation/widgets/pin_view.dart';
import 'package:banking_app/features/profile/dormain/repository/local/profile_store.dart';
import 'package:flutter/material.dart';

class ConfirmPinScreen extends StatefulWidget {
  const ConfirmPinScreen(
      {Key? key,
      required this.onDone,
      required this.onCorrect,
      required this.onFailed})
      : super(key: key);
  final Function(String) onDone;
  final Function(String) onCorrect;
  final Function() onFailed;

  @override
  State<ConfirmPinScreen> createState() => _ConfirmPinScreenState();
}

class _ConfirmPinScreenState extends State<ConfirmPinScreen> {
  final _pinController = PINController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 70,
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
                const SizedBox(
                  height: 20,
                ),
                PinView(
                    onDigitPressed: (pin) {},
                    onDelete: () {},
                    onDone: widget.onDone,
                    pinController: _pinController),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),

          // CustomButton(child: const Text('Set Pin'), onPressed: () {}),
          // const SizedBox(
          //   height: 60,
          // ),
        ],
      ),
    );
  }

  Future<bool> isCorrect(String pin) async {
    final profile = await injector.get<ProfileStore>().getUserProfile();
    AppUtils.showCustomToast(profile?.transactionPin!);

    if (profile?.transactionPin! == pin) {
      return true;
    }
    return false;
  }

  void checkPin(String pin) async {
    if (await isCorrect(pin)) {
      widget.onCorrect(pin);
    } else {
      _pinController.resetPin();
      AppUtils.showCustomToast('Pin incorrect');
      widget.onFailed();
    }
  }
}
