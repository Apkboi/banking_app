import 'package:banking_app/features/transactions/presentation/widgets/TransactionDetailTile.dart';
import 'package:flutter/material.dart';

class TransactionDetailsSheet extends StatefulWidget {
  const TransactionDetailsSheet({Key? key}) : super(key: key);

  @override
  State<TransactionDetailsSheet> createState() =>
      _TransactionDetailsSheetState();
}

class _TransactionDetailsSheetState extends State<TransactionDetailsSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Transaction Details',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(
            height: 16,
          ),
          const TransactionDetailTile(
            leading:      'Transaction ID',
            trailing:      'dddd',
          ),

          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
           const TransactionDetailTile(
            leading:     'Comment',
            trailing:    'Nothing',

          ),

          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          const TransactionDetailTile(
            leading:   'Payment Method',
            trailing:   'Card Transfer',

          ),

          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          const TransactionDetailTile(
            leading: 'Payment Category',
            trailing:  'Data subscription',
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          const TransactionDetailTile(
            leading: 'Status',
            trailing: 'Completed',
            trailingColor: true ? Colors.green : Colors.red,
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 16,
          ),
          const TransactionDetailTile(
            leading:  'Amount(In Naira)',
            trailing:  'NGN ${300}',
          ),

          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
