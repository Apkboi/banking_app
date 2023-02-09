import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/features/auth/data/models/auth_success_response.dart';
import 'package:banking_app/features/auth/presentation/screens/set_passcode_screen.dart';
import 'package:banking_app/features/auth/presentation/screens/transaction_pin_screen.dart';
import 'package:flutter/material.dart';

class WelcomeDialog extends StatefulWidget {
  const WelcomeDialog({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  State<WelcomeDialog> createState() => _WelcomeDialogState();
}

class _WelcomeDialogState extends State<WelcomeDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),

      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/gif/sign_up_emoji.gif',
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Welcome back ${widget.profile.fullname} 👊🏿',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
                'We noticed that you haven\'t completed your registration process please press Continue to complete registration.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey)),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              child: const Text('Continue'),
              onPressed: () {
                switch (widget.profile.completedProfile) {
                  case 1:
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const TransactionPinScreen(),
                    ));
                    break;
                  case 2:
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const TransactionPinScreen(),
                    ));
                    break;
                  case 3:
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SetPasscodeScreen(),
                    ));
                    break;
                }
              })
        ],
      ),
    );
  }
}
