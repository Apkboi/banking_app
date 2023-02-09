import 'package:flutter/material.dart';

class BillItem extends StatefulWidget {
  const BillItem(
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
  State<BillItem> createState() => _BillItemState();
}

class _BillItemState extends State<BillItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.icon,
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.billTittle,
                    style:  TextStyle(
                      fontWeight: FontWeight.w500,
                      color:Theme.of(context).colorScheme.onPrimary,
                      fontSize: 13,
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
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
