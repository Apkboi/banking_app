import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green),
            child: Center(
              child: LineIcon.spotify(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Spotify Premium',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                SizedBox(
                  height: 8,
                ),
                Text('12 Dec, 2022',style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          const Text(
            '-\$200',
            style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,),
          )
        ],
      ),
    );
  }
}
