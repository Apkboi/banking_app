import 'dart:developer';

import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/auth/presentation/widgets/pin_view.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            LineIcon.lock(),
            const SizedBox(
              width: 10,
            ),
            const Text('Set Duress Pin'),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
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
                  const Text(
                    'NOTE : You can use this pin when ever you are in a duress condition to transfer your funds to suspense account',
                    style: TextStyle(color: Colors.orange),
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
        // _authBloc.add(SetTransactionPinEvent(email: widget.email, pin: pin));
      } else {
        _pinController.resetPin();
        pin = '';
        confirmPin = '';
        pinMode = TransactionPinMode.normal;
        AppUtils.showCustomToast("Pin does not match");
      }
    }
    setState(() {
      log("MODE: $pinMode");
      log("PIN: $pin");
      log("Confirm Pin: $confirmPin");
    });
  }
}
