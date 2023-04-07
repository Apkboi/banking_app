import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/features/transactions/data/models/get_transaction_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransferSuccessDialog extends StatefulWidget {
  const TransferSuccessDialog({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;

  @override
  State<TransferSuccessDialog> createState() => _TransferSuccessDialogState();
}

class _TransferSuccessDialogState extends State<TransferSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/svgs/good.svg',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Transfer Successful',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'You just sent NGN${widget.transaction.amount} to ${widget.transaction.accountName}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
