import 'dart:ui';

import 'package:banking_app/app/presentation/widgets/copy_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class CardDetailsSheet extends StatefulWidget {
  const CardDetailsSheet({Key? key}) : super(key: key);

  @override
  State<CardDetailsSheet> createState() => _CardDetailsSheetState();
}

class _CardDetailsSheetState extends State<CardDetailsSheet> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5,sigmaY: 5),
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).bottomSheetTheme.backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text('Card details',style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 18,fontWeight: FontWeight.w500),),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Card Number',
              style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor),
              child: Row(
                children: [

                  Expanded(
                    child: Text(
                      '123 4567 8765 654',
                      maxLines: 1,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                 const CopyWidget()
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Expiry Date',
              style: TextStyle(fontWeight: FontWeight.w500,color: Colors.grey,),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor),
              child: Row(
                children: [

                  Expanded(
                    child: Text(
                      '12/23',
                      maxLines: 1,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const CopyWidget()
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),


            const Text(
              'CVV',
              style: TextStyle(fontWeight: FontWeight.w500,color:  Colors.grey,),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor),
              child: Row(
                children: [

                  Expanded(
                    child: Text(
                      '322',
                      maxLines: 1,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const CopyWidget()
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Card Pin',
              style: TextStyle(fontWeight: FontWeight.w500,color:  Colors.grey,),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor),
              child: Row(
                children: [

                  Expanded(
                    child: Text(
                      '****',
                      maxLines: 1,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),

                  true?
                      LineIcon.eyeAlt():
                  const CopyWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
