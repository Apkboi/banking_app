import 'package:banking_app/features/cards/presentation/widgets/card_details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.selected,
  }) : super(key: key);

  final bool selected;

  // final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                'assets/jpeg/card_bg.jpeg',
              ),
              fit: BoxFit.cover),
          border: selected ? Border.all(color: Colors.teal, width: 2) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Pablo escobar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Master card',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => const CardDetailsSheet(),
                        );
                      },
                      icon: LineIcon.eyeAlt())
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '100******1666',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, letterSpacing: 3),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/png/mastercard.png',
                    height: 50,
                    width: 70,
                  ),
                  const Text(
                    'VALID TILL : 03/23',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
