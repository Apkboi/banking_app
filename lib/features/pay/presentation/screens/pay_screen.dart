import 'package:banking_app/features/home/presentation/widgets/beneficiaries.dart';
import 'package:banking_app/features/home/presentation/widgets/send.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/paybills.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Pay",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.deepPurple.withOpacity(0.1)),
                    child: Icon(Icons.search),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Beneficiaries",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 120,
                  ),
                  Text(
                    "view all",
                    style: TextStyle(
                        color: Colors.green.withOpacity(0.8),

                        ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => const Beneficiaries(),
                      shrinkWrap: true,
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Send Money",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
           const SizedBox(height: 10,),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => const SendMoney(),
            ),
            const SizedBox(height: 20,),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Pay Bills",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => const PayBills(),
              ),
            )

          ],
        ),
      ),
    );
  }
}
