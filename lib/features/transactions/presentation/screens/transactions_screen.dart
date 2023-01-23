import 'package:banking_app/app/presentation/widgets/search_field.dart';
import 'package:banking_app/features/transactions/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              LineIcon.barChartAlt(),
              const SizedBox(width: 10,),
              const Text('Transaction History',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              const Expanded(child: SearchField()),
              const SizedBox(width: 8,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(child: LineIcon.calendar()),
              ),
              const SizedBox(width: 8,),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(child: LineIcon.sort()),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) => const TransactionItem(),
            ),
          )
        ],
      ),
    );
  }
}
