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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.indigo),
            child: const Center(
              child: Text(
                "T",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
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
            'Emma',
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
