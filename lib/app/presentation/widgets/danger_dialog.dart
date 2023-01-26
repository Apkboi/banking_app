import 'package:flutter/material.dart';

class DangerDialog extends StatefulWidget {
  const DangerDialog(
      {Key? key, this.title, this.message, this.buttonText, this.onDismiss})
      : super(key: key);
  final String? title;
  final String? message;
  final String? buttonText;
  final bool? isDismissible = true;
  final VoidCallback? onDismiss;

  @override
  State<DangerDialog> createState() => _DangerDialogState();
}

class _DangerDialogState extends State<DangerDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
      decoration: BoxDecoration(
          color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_rounded,
                size: 25,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.title ?? 'Suspicious Transaction',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.message ??
                'Sorry  a suspicious activity was notice from this transaction, please provide an OTP sent to your phone number (09012****11),',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.redAccent),
                child: Text(widget.buttonText ?? 'Enter OTP'),
              ))
            ],
          )
        ],
      ),
    );
  }
}
