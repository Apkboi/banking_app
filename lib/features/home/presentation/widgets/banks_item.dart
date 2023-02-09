import 'package:flutter/material.dart';

class BanksItem extends StatefulWidget {
   BanksItem({Key? key,this.selected = false}) : super(key: key);
   bool selected = false;

  @override
  State<BanksItem> createState() => _BanksItemState();
}

class _BanksItemState extends State<BanksItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 50,
      width: 55,
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: widget.selected ? Border.all(color: Theme.of(context).primaryColor):null,
        color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(6),
          image: const DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage('assets/png/zenith_logo.png'),
          )), duration: const Duration(milliseconds: 500),
    );
  }
}
