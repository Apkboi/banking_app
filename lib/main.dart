import 'package:banking_app/core/theme/app_theme.dart';
import 'package:banking_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/core/di/injector.dart' as di;
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await di.setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: AppTheme.darkTheme,
      home: const LoginScreen(),
    );
  }
}
