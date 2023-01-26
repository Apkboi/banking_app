import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:banking_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:banking_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 90,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: Image.asset('assets/gif/login_emoji.gif'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Welcome back',
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Enter you login credentials and continue enjoying secured banking.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedFormField(
              hint: 'Enter your email.',
              preffix: LineIcon.userAlt(),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedFormField(
              hint: 'Enter your Password',
              preffix: LineIcon.lockOpen(),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                child: const Text('Login')),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Dont have an account ?'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Register',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
