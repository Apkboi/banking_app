import 'package:flutter/material.dart';

class PayBills extends StatefulWidget {

  const PayBills(
      {Key? key,
      required this.onTap,
      required this.billTittle,
      required this.billDescription,
      required this.icon})
      : super(key: key);
  final VoidCallback onTap;
  final String billTittle;
  final String billDescription;
  final Widget icon;


  @override
  State<PayBills> createState() => _PayBillsState();
}

class _PayBillsState extends State<PayBills> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.icon,
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.billTittle,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,

                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(widget.billDescription,
                      style: const TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black.withOpacity(0.4),
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
