import 'package:banking_app/core/constants/storage_keys.dart';
import 'package:banking_app/core/helpers/storage_helper.dart';
import 'package:banking_app/core/services/push_notification_service.dart';
import 'package:banking_app/core/theme/app_theme.dart';
import 'package:banking_app/features/auth/presentation/screens/login_screen.dart';
import 'package:banking_app/features/home/presentation/screens/home_screen.dart';
import 'package:banking_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:banking_app/core/di/injector.dart' as di;
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await PushNotificationService.initialize();
  await Hive.initFlutter();
  await di.setup();
  final firstScreen = await getFirstScreen();
  await Future.delayed(const Duration(milliseconds: 2500));
  runApp(MyApp(
    firstScreen: firstScreen,
  ));
}

class MyApp extends StatelessWidget {
  final Widget firstScreen;

  const MyApp({super.key, required this.firstScreen});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: AppTheme.lightTheme,
      home: firstScreen,
    );
  }
}

Future<Widget> getFirstScreen() async {
  bool stayLogin =
      await StorageHelper.getBoolean(StorageKeys.stayLoggedIn, false);

  return stayLogin ? const HomeScreen() : const LoginScreen();
}
