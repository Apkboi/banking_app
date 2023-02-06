import 'package:flutter/material.dart';

class CircularLoader extends StatefulWidget {
  const CircularLoader({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  State<CircularLoader> createState() => _CircularLoaderState();
}

class _CircularLoaderState extends State<CircularLoader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: widget.color ?? Colors.white,
      ),
    );
  }
}
