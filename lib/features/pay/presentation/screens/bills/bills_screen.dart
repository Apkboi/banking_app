import 'package:banking_app/features/pay/presentation/screens/bills/betting_subscription_screen.dart';
import 'package:banking_app/features/pay/presentation/screens/bills/internet_payment_screen.dart';
import 'package:banking_app/features/pay/presentation/screens/bills/tv_payment_screen.dart';
import 'package:banking_app/features/pay/presentation/widgets/bills_item.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

import 'electricity_payment_screen.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({Key? key}) : super(key: key);

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pay a bill'),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children:  [
            const SizedBox(height: 20,),
            PayBills(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TvPaymentScreen(),
                ));
              },
              billTittle: 'Tv',
              billDescription: 'Pay for different tv providers.',
              icon: LineIcon.television(
                size: 25,
                color: Colors.lightBlueAccent,
              ),
            ),
            PayBills(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InternetPaymentScreen(),
                ));
              },
              billTittle: 'Internet',
              billDescription: 'Buy data for different network providers',
              icon: LineIcon.mobilePhone(
                size: 25,
                color: Colors.purple,
              ),
            ),
            PayBills(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ElectricityPaymentScreen(),
                ));
              },
              billTittle: 'Electricity',
              billDescription: 'Pay for electricity bills.',
              icon: LineIcon.lightbulb(
                size: 25,
                color: Colors.orangeAccent,
              ),
            ),
            PayBills(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BettingSubscriptionScreen(),
                ));
              },
              billTittle: 'Betting',
              billDescription: 'Fund your betting wallet',
              icon: LineIcon.basketballBall(
                size: 25,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
