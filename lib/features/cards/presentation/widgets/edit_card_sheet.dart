import 'dart:ui';

import 'package:banking_app/features/cards/presentation/screens/change_card_pin_screen.dart';
import 'package:banking_app/features/home/presentation/screens/top_up_from_bank_screen.dart';
import 'package:banking_app/features/pay/presentation/widgets/bills_item.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
class EditCardSheet extends StatefulWidget {
  const EditCardSheet({Key? key}) : super(key: key);

  @override
  State<EditCardSheet> createState() => _EditCardSheetState();
}

class _EditCardSheetState extends State<EditCardSheet> {
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
              'Edit card.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(height: 10,),
            BillItem(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>const ChangeCardPinScreen(),));
              },
              billTittle: 'Change card pin',
              billDescription: 'Update the pin for this card.',
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey.withOpacity(0.1)),
                child: Center(
                  child: LineIcon.key(
                    color: Colors.blueGrey,
                  ),
                ),
              ),),
            BillItem(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const TopUpFromBankScreen(),));
              },
              billTittle: 'Card limit',
              billDescription: 'Update the limit which this card can spend.',
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red.withOpacity(0.1)),
                child:  Center(
                  child: LineIcon.cog(color: Colors.redAccent,),
                ),
              ),)
          ],
        ),
      ),
    );
  }
}
