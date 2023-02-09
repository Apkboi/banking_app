import 'package:flutter/material.dart';

class TransactionDetailTile extends StatefulWidget {
  const TransactionDetailTile(
      {Key? key, required this.leading, required this.trailing,  this.trailingColor})
      : super(key: key);
  final String leading;
  final String trailing;
  final Color? trailingColor;

  @override
  State<TransactionDetailTile> createState() => _TransactionDetailTileState();
}

class _TransactionDetailTileState extends State<TransactionDetailTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:  [
        Text(
          widget.leading,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontWeight: FontWeight.w500),
        ),
        Text(
         widget.trailing,
          style: TextStyle(
            color: widget.trailingColor??Colors.grey,
          ),
        )
      ],
    );
  }
}
