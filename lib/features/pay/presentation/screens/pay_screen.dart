import 'package:banking_app/features/home/presentation/widgets/beneficiary_item.dart';
import 'package:flutter/material.dart';

import '../widgets/bills_item.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              "Pay",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(),
            Row(
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
            const SizedBox(height: 10,),
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => const BeneficiaryItem(),
                shrinkWrap: true,
                itemCount: 10,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
              ),
            ),


            const Text(
              "Pay Bills",
              style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
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
