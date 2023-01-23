import 'package:banking_app/core/theme/app_theme.dart';
import 'package:banking_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}


