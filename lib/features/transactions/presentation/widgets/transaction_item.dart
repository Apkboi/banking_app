import 'dart:ui';

import 'package:banking_app/features/transactions/presentation/widgets/transaction_details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: const TransactionDetailsSheet()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple.withOpacity(0.2)),
              child: Center(
                child: LineIcon.internetExplorer(
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'Internet Subscription',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text('12 Dec, 2022', style: TextStyle(fontSize: 13,color: Colors.grey)),
                ],
              ),
            ),
            const Text(
              '-\$200',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
