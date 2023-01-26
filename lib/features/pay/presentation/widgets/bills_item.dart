import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
class PayBills extends StatefulWidget {
  const PayBills({Key? key}) : super(key: key);

  @override
  State<PayBills> createState() => _PayBillsState();
}

class _PayBillsState extends State<PayBills> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
         LineIcon.githubSquare(size: 30),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Buy Airtime',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('Recharge any phone easily',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey)),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded,color: Colors.black.withOpacity(0.4),size: 20,)
        ],
      ),
    );
  }
}
