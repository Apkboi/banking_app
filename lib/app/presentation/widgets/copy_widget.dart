import 'package:flutter/material.dart';

class CopyWidget extends StatefulWidget {
  const CopyWidget({Key? key, this.copyText}) : super(key: key);
  final String? copyText;

  @override
  State<CopyWidget> createState() => _CopyWidgetState();
}

class _CopyWidgetState extends State<CopyWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: const [
          Text(
            'Copy',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.copy_all,
            size: 18,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
