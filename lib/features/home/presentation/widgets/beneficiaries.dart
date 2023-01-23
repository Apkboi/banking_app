import 'package:flutter/material.dart';

class Beneficiaries extends StatefulWidget {
  const Beneficiaries({Key? key}) : super(key: key);

  @override
  State<Beneficiaries> createState() => _BeneficiariesState();
}

class _BeneficiariesState extends State<Beneficiaries> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple,
            ),
            child: const Center(
              child: Text(
                "T",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        const  SizedBox(height: 10,),
          const Text("Send")
        ],
      ),
    );
  }
}
