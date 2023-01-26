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
  final _pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox(),
                secondChild: InkWell(
                  onTap: (){
                    _switchPage(0);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).primaryColor),
                      color: Colors.transparent,
                    ),
                    child: LineIcon.arrowLeft(
                      size: 18,
                    ),
                  ),
                ),
                crossFadeState: pageIndex == 0
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 400),
              ),
              const SizedBox(
                height: 16,
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
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    _SignupForm1(
                      onValidate: () {
                      _switchPage(1);
                      },
                    ),
                    _SignupForm2(
                      onValidate: () {},
                    )
                  ],
                ),
              ),
              // CustomButton(
              //     onPressed: () {
              //       Navigator.pushReplacement(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const TransactionPinScreen(),
              //           ));
              //     },
              //     child: const Text('Create Account')),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).pushReplacement(MaterialPageRoute(
              //       builder: (context) => const LoginScreen(),
              //     ));
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(10.0),
              //     child: Center(
              //       child: Row(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           const Text('Already have an account ?'),
              //           const SizedBox(
              //             width: 8,
              //           ),
              //           Text(
              //             'Login',
              //             style:
              //                 TextStyle(color: Theme.of(context).primaryColor),
              //           ),
              //           const SizedBox(
              //             height: 26,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
  void _switchPage(int index){
    _pageController.jumpToPage(index);
    setState(() {
      pageIndex = index;
    });
  }
}

class _SignupForm1 extends StatefulWidget {
  const _SignupForm1({Key? key, required this.onValidate}) : super(key: key);
  final Function onValidate;

  @override
  State<_SignupForm1> createState() => _SignupForm1State();
}

class _SignupForm1State extends State<_SignupForm1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        CustomButton(
            onPressed: () {
              // Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const TransactionPinScreen(),
              //     ));
              widget.onValidate();
            },
            child: const Text('Continue')),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Already have an account ?'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Login',
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
    );
  }
}

class _SignupForm2 extends StatefulWidget {
  const _SignupForm2({Key? key, required this.onValidate}) : super(key: key);
  final Function onValidate;

  @override
  State<_SignupForm2> createState() => _SignupForm2State();
}

class _SignupForm2State extends State<_SignupForm2> {
  DateTime dob = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          AppUtils.formatDateTime(dob),
                          maxLines: 1,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
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
              // widget.onValidate();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransactionPinScreen(),
                  ));
            },
            child: const Text('Create Account')),
        InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Already have an account ?'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Login',
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
    );
  }
}
