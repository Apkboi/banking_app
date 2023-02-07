import 'package:flutter/material.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({Key? key}) : super(key: key);

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black, width: 2)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      const Text(
                        "Credit Card",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "MIS TARJETAS",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          buildCardContainer("assets/jpg/images.jpg"),
                          buildCardContainer("assets/jpeg/visacard.jpeg"),
                        ],
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Text(
                "RECENT TRANSACTIONS",
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.5)),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: 10,
                    shrinkWrap: true,
                    physics:const BouncingScrollPhysics(),

                    itemBuilder: (context, index) => recentTransactions(
                        "ABR",
                        "23",
                        "\$6.00",
                        "Recarga cueta Movilplata",
                        "MasterCard****6541")))
          ],
        ),
      ),
    );
  }
}

buildCardContainer(String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    child: Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    ),
  );
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
