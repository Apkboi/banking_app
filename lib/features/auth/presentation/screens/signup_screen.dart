import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/auth/presentation/screens/login_screen.dart';
import 'package:banking_app/features/auth/presentation/screens/transaction_pin_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime dob = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),

              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                child: Image.asset('assets/gif/sign_up_emoji.gif'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Create an account',
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Create an account with us in few steps and enjoy secured banking.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedFormField(
                hint: 'Enter your fullname.',
                preffix: LineIcon.userAlt(),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedFormField(
                hint: 'Enter your email address.',
                preffix: LineIcon.mailBulk(),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedFormField(
                hint: 'Enter your phone number.',
                preffix: LineIcon.phone(),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedFormField(
                hint: 'Enter your BVN.',
                preffix: LineIcon.identificationCard(),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        AppUtils.pickDate(context).then((value) => {
                          setState(() {
                            dob = value!;
                          })
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).cardColor),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.date_range,
                              size: 18,
                              color:
                             Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                AppUtils.formatDateTime(dob),
                                maxLines: 1,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedFormField(
                hint: 'Address.',
                preffix: LineIcon.identificationCard(),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedFormField(
                hint: 'Password.',
                preffix: LineIcon.lock(),
              ),
              const SizedBox(
                height: 16,
              ),
              OutlinedFormField(
                hint: 'Confirm Password.',
                preffix: LineIcon.lock(),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransactionPinScreen(),
                        ));
                  },
                  child: const Text('Create Account')),

              InkWell(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginScreen(),));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Row(mainAxisSize: MainAxisSize.min,children:  [
                      const Text('Already have an account ?'),
                      const SizedBox(width: 8,),
                      Text('Login',style: TextStyle(color: Theme.of(context).primaryColor),),
                      const SizedBox(
                        height: 26,
                      ),
                    ],),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
