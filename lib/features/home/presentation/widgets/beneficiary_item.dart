import 'package:banking_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BeneficiaryItem extends StatefulWidget {
  const BeneficiaryItem({Key? key}) : super(key: key);

  @override
  State<BeneficiaryItem> createState() => _BeneficiaryItemState();
}

class _BeneficiaryItemState extends State<BeneficiaryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: AppTheme.iconContainerDecoration(Colors.orange.withOpacity(0.1)).copyWith(
              image: const DecorationImage(image: AssetImage('assets/jpg/person.jpg'),fit: BoxFit.cover,)
            ),

          ),
          // const CircleAvatar(
          //   backgroundColor: Colors.brown,
          //   radius: 22,
          // ),
          const SizedBox(
            height: 5,
          ),
           const Text(
            'Williams',
            style: TextStyle(fontWeight: FontWeight.w300,fontSize: 13,color:Colors.grey),
          )
        ],
      ),
    );
  }
}
