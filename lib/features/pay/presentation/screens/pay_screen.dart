import 'package:banking_app/features/home/presentation/widgets/beneficiary_item.dart';
import 'package:banking_app/features/pay/presentation/screens/bills/bills_screen.dart';
import 'package:banking_app/features/pay/presentation/screens/bills/buy_airtime_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import '../widgets/bills_item.dart';
import 'bank_transfer_screen.dart';
import 'beta_to_beta_transfer.dart';

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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: const [
                Icon(Icons.show_chart_rounded),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Pay",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Beneficiaries",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "view all",
                  style: TextStyle(
                    color: Colors.green.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
              "Send Money",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            PayBills(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BankTransferScreen(),
                ));
              },
              billTittle: 'Send to bank account',
              billDescription: 'Easily transfer to different banks',
              icon: const Icon(
                Icons.account_balance_rounded,
                size: 25,
                color: Colors.green,
              ),
            ),
            PayBills(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BataToBeta(),
                ));
              },
              billTittle: 'Sent to Beta bank',
              billDescription: 'Easily send money to a beta bank account',
              icon: LineIcon.alternateShield(
                size: 25,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Pay Bills",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            PayBills(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BuyAirtimeScreen(),
                ));
              },
              billTittle: 'Buy Airtime',
              billDescription: 'Recharge any phone easily',
              icon: LineIcon.mobilePhone(
                size: 25,
                color: Colors.orangeAccent,
              ),
            ),
            PayBills(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BillsScreen(),
                ));
              },
              billTittle: 'Pay a bill',
              billDescription: 'Easily pay basic bills',
              icon: LineIcon.wallet(
                size: 25,
                color: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
