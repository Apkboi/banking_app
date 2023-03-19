import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/cards/presentation/widgets/card_widget.dart';
import 'package:banking_app/features/cards/presentation/widgets/edit_card_sheet.dart';
import 'package:banking_app/features/pay/presentation/widgets/bills_item.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({Key? key}) : super(key: key);

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'Cards',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your cards",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).primaryColor),
                    child: Row(
                      children: [
                        const Text('Request new card'),
                        const SizedBox(
                          width: 10,
                        ),
                        LineIcon.plus(
                          size: 16,
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 210,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              allowImplicitScrolling: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: 5,
              itemBuilder: (context, index) {
                var _scale = currentIndex == index ? 1.0 : 0.9;
                return TweenAnimationBuilder<double>(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 335),
                  tween: Tween(begin: _scale, end: _scale),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: CardWidget(
                    selected: index == currentIndex,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Text(
              "Manage Cards",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                BillItem(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) => const EditCardSheet(),
                    );
                  },
                  billTittle: 'Edit Card',
                  billDescription:
                      'You can choose to change card pin and limits.',
                  icon: LineIcon.creditCard(
                    color: Colors.orangeAccent,
                  ),
                ),
                BillItem(
                  onTap: () {
                    AppUtils.showErrorDialog(context,
                        title: 'Block card',
                        buttonText: 'Continue',
                        message:
                            'Blocking your card will temporarily disable your card are you sure you want to continue ?');
                  },
                  billTittle: 'Block card',
                  billDescription:
                      'You can choose to temporarily disable card.',
                  icon: LineIcon.ban(
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

recentTransactions(
    String shrtDesc, String num, String amount, String text, String suText) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shrtDesc,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  Text(
                    num,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(
                    suText,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  amount,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
