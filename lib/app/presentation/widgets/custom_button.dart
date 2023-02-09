import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? bgColor;

  const CustomButton({Key? key, required this.child, required this.onPressed,  this.bgColor})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          onPressed: widget.onPressed,

          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(18),
            foregroundColor: Colors.white,

            disabledBackgroundColor: Theme.of(context).primaryColor.withAlpha(-200),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: widget.child,
        )),
      ],
    );
  }
}
