import 'dart:ui';

import 'package:banking_app/features/home/presentation/screens/top_up_from_bank_screen.dart';
import 'package:banking_app/features/home/presentation/screens/topup_with_beta_screen.dart';
import 'package:banking_app/features/pay/presentation/widgets/bills_item.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class TopUpSheet extends StatefulWidget {
  const TopUpSheet({Key? key}) : super(key: key);

  @override
  State<TopUpSheet> createState() => _TopUpSheetState();
}

class _TopUpSheetState extends State<TopUpSheet> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme
              .of(context)
              .bottomSheetTheme
              .backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              'Top up account.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(height: 10,),
            BillItem(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>const TopUpWithBetaScreen(),));
              },
              billTittle: 'Receive from BETA BANK',
              billDescription: 'Receive money from another beta bank ',
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.withOpacity(0.1)),
                child: Center(
                  child: LineIcon.algolia(
                    color: Colors.green,
                  ),
                ),
              ),),
            BillItem(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const TopUpFromBankScreen(),));
              },
              billTittle: 'Receive from another bank',
              billDescription: 'Receive money from a different  bank ',
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.withOpacity(0.1)),
                child: const Center(
                  child: Icon(
                    Icons.account_balance_rounded,
                    color: Colors.red,
                  ),
                ),
              ),)
          ],
        ),
      ),
    );
  }
}
