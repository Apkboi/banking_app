import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            height:40,
            width: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: const Center(
              child: Icon(Icons.language),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Send to @username',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.deepPurple),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('Send to my Kuda account for free',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.deepPurple.withOpacity(0.3))),
              ],
            ),
          ),
           Icon(Icons.arrow_forward_ios,color: Colors.black.withOpacity(0.4),size: 20,)
        ],
      ),
    );
  }
}
