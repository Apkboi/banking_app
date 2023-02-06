import 'package:flutter/material.dart';

import 'moreitems/securitypage.dart';

class MoreTab extends StatefulWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  State<MoreTab> createState() => _MoreTabState();
}

class _MoreTabState extends State<MoreTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                  child: Text(
                "More",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              )),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 30,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Moses Gideon",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,),
                        ),
                        Text(
                          "Account details",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,color: Colors.grey,
                  )
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.book,color: Colors.grey,),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Statements & Reports ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Download monthly statements",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,color: Colors.grey,
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.help,color: Colors.redAccent,),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Get Help",
                                style: TextStyle(

                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Get support or send feedback",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Security()));},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(Icons.lock,color: Colors.orangeAccent,),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Security",
                                  style: TextStyle(

                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "Protect yourself from intruders",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.arrow_circle_right_sharp,color: Colors.blueGrey,),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Account Limits",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "How much you can spend and recieve",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.redAccent.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(Icons.legend_toggle,color: Colors.redAccent,),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Legal ",
                                style: TextStyle(

                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "About our contract with you",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Sign out",
                              style: TextStyle(color: Colors.redAccent),
                            ))),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "2.00138",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
