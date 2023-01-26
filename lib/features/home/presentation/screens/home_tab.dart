import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/home/presentation/widgets/beneficiary_item.dart';
import 'package:banking_app/features/transactions/presentation/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello Williams 💰💰',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                const CircleAvatar(
                  radius: 25,
                  child: CircleAvatar(
                    backgroundColor: Colors.brown,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const _BalanceWidget(),
            const SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => const BeneficiaryItem(),
                      shrinkWrap: true,
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                IconButton(
                  onPressed: () {},
                  icon: LineIcon.arrowCircleRight(),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Recent Transactions',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Today 30th, Dec',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => const TransactionItem(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BalanceWidget extends StatefulWidget {
  const _BalanceWidget({Key? key}) : super(key: key);

  @override
  State<_BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<_BalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(image: AssetImage('assets/jpeg/indigo_bg.jpeg',),fit: BoxFit.cover)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Current Balance',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '\$5,000,00',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              AppUtils.showErrorDialog(context);
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.indigo,
              child: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
