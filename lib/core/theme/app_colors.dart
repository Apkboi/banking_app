import 'package:flutter/material.dart';

const Color darkBackgroundColor = Color(0xFF121212);
const Color lightBackgroundColor = Color(0xFFFFFFFF);

const Color darkCardColor = Color(0xFF393939);
// const Color darkCardColor = Color(0xFF002b62);
final Color lightCardColor = const Color(0xFF9D9D9D).withOpacity(0.1);

const Color darkBottomSheetColor = Color(0xFF252836);
const Color lightBottomSheetColor = Colors.white;

const Color white = Colors.white;
const smokeWhite = Color(0xFFf1f7f8);
const Color black = Colors.black;
const red = Color(0xFFff0000);

const Color gold = Color(0xFFcfa23c);

 const primaryColor = Color.fromARGB(255, 29, 95, 201);
 const gradient = Color(0xFF0e0ba0);
 const gradient2 = Color(0xFF02156B);
 const textColor = Color(0xFF5f6368);
 const chipsColor = Color(0xFF77a1ff);
 const lightGrey = Color(0xFFebebf7);


extension ColorSchemeEx on ColorScheme {
  Color get backgroundColor => brightness == Brightness.dark
      ? darkBackgroundColor
      : lightBackgroundColor;
  Color get toolbarColor => brightness == Brightness.dark
      ? darkBackgroundColor
      : lightBackgroundColor;
}