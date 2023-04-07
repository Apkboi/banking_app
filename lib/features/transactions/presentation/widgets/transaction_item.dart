import 'dart:ui';

import 'package:banking_app/features/transactions/data/models/get_transaction_response.dart';
import 'package:banking_app/features/transactions/presentation/widgets/transaction_details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:banking_app/core/helpers/extension.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
              child: TransactionDetailsSheet(
                transaction: transaction,
              )),
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
                  color: Theme.of(context).primaryColor.withOpacity(0.2)),
              child: Center(
                child: LineIcon.alternateSync(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.accountName!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(transaction.updatedAt!.formatToDate,
                      style: const TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
            ),
            Text(
              '\$${transaction.amount}',
              style: const TextStyle(
                // color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
