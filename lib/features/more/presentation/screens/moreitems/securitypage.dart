import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Security extends StatefulWidget {
  const Security({Key? key}) : super(key: key);

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(children:  [
               GestureDetector(
                 onTap: (){
                   Navigator.pop(context);
                 },
                 child:const  Icon(
                   Icons.arrow_back_ios,
                   color: Colors.white,
                 ),
               ),
              const  SizedBox(
                  width: 100,
                ),
                const Text(
                  "Security",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                )
              ]),
            ),
            const Divider(
              color: Colors.white,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  buildSecurityOption("Biometrics", true),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 40,width: 40,
                          decoration: BoxDecoration(
                            
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)
                          ),

                            child: Icon(Icons.pin,color: Colors.blue,)),
                        const SizedBox(width: 20,),
                        const Text(
                          "Transaction Pin",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Row(
                      children: [
                        Container(
                            height: 40,width: 40,
                            decoration: BoxDecoration(

                                color: Colors.yellow.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child: Icon(Icons.remove_red_eye,color: Colors.yellow,)),
                        const SizedBox(width: 30,),
                        const Text(
                          "Private Mode",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                      ],
                    ),
                  ),
                  buildScreenshotOption("Allow creenshots", true),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildSecurityOption(String title, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.fingerprint_rounded,
              color: Colors.greenAccent,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Spacer(),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: isActive,
                onChanged: (bool val) {},
              ))
        ],
      ),
    );
  }
  Padding buildScreenshotOption(String title, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.photo,
              color: Colors.greenAccent,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Spacer(),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                value: isActive,
                onChanged: (bool val) {},
              ))
        ],
      ),
    );
  }

}
