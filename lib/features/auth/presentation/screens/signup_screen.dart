import 'dart:developer';
import 'package:banking_app/app/presentation/widgets/circular_loader.dart';
import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/core/helpers/validators.dart';
import 'package:banking_app/features/auth/presentation/blocs/auth_blocs/auths_bloc.dart';
import 'package:banking_app/features/auth/presentation/screens/login_screen.dart';
import 'package:banking_app/features/auth/presentation/screens/transaction_pin_screen.dart';
import 'package:banking_app/features/auth/presentation/widgets/dialogs/auth_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_icons/line_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _pageController = PageController();
  int pageIndex = 0;
  bool fieldsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (pageIndex == 0) {
          return true;
        } else {
          _switchPage(0);
          return false;
        }
      },
      child: Scaffold(
        // backgroundColor: Color,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocListener<AuthBloc, AuthState>(
            bloc: injector.get<AuthBloc>(),
            listener: (context, state) {
              if (state is RegisterLoadingState) {
                setState(() {
                  fieldsEnabled = false;
                });
              }
              if (state is AuthFailureState) {
                setState(() {
                  fieldsEnabled = true;
                });
              }
              if (state is RegisterSuccessState) {
                setState(() {
                  fieldsEnabled = true;
                });
              }
            },
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
                      onTap: fieldsEnabled
                          ? () {
                              _switchPage(0);
                            }
                          : null,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
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
                    style: TextStyle(fontSize: 14, color: Colors.grey),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _switchPage(int index) {
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

class _SignupForm1State extends State<_SignupForm1>
    with AutomaticKeepAliveClientMixin {
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final bvnController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedFormField(
              hint: 'Enter your fullname.',
              preffix: LineIcon.userAlt(),
              controller: fullnameController,
              validator: RequiredValidator(errorText: 'Enter your full name'),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedFormField(
              hint: 'Enter your email address.',
              preffix: LineIcon.mailBulk(),
              controller: emailController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Enter your email'),
                EmailValidator(errorText: 'Invalid Email')
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedFormField(
              hint: 'Enter your username.',
              preffix: LineIcon.mailBulk(),
              controller: usernameController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Enter your username'),
                MinLengthValidator(5,
                    errorText: 'Username must be up to 5 character')
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedFormField(
              hint: 'Enter your phone number.',
              preffix: LineIcon.phone(),
              controller: phoneNumberController,
              inputType: TextInputType.number,
              validator: MultiValidator([
                MinLengthValidator(10, errorText: 'Enter a valid phone number'),
                RequiredValidator(errorText: 'Enter your phone number')
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedFormField(
              hint: 'Enter your BVN.',
              preffix: LineIcon.identificationCard(),
              controller: bvnController,
              inputType: TextInputType.number,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Enter your email'),
                MinLengthValidator(10,
                    errorText: 'BVN must be up to 10 numbers')
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
                onPressed: () {
                  if (validate()) {
                    widget.onValidate();
                  }
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
        ),
      ),
    );
  }

  bool validate() {
    var payload = injector.get<AuthBloc>().registerPayload;

    payload.fullname = fullnameController.text.toString();
    payload.email = emailController.text.toString();
    payload.phone = phoneNumberController.text.toString();
    payload.username = usernameController.text.toString();
    payload.bvn = bvnController.text.toString();
    return _formKey.currentState!.validate();
  }

  @override
  bool get wantKeepAlive => true;
}

class _SignupForm2 extends StatefulWidget {
  const _SignupForm2({Key? key, required this.onValidate}) : super(key: key);
  final Function onValidate;

  @override
  State<_SignupForm2> createState() => _SignupForm2State();
}

class _SignupForm2State extends State<_SignupForm2>
    with AutomaticKeepAliveClientMixin {
  DateTime? dob;
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var payload = injector.get<AuthBloc>().registerPayload;
  var bloc = injector.get<AuthBloc>();
  final _formKey = GlobalKey<FormState>();
  bool fieldsEnabled = true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: fieldsEnabled
                        ? () {
                            AppUtils.pickDate(context).then((value) => {
                                  setState(() {
                                    dob = value!;
                                  })
                                });
                          }
                        : null,
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
                              dob != null
                                  ? AppUtils.formatDateTime(dob)
                                  : 'Select Date of birth',
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
              enabled: fieldsEnabled,
              preffix: LineIcon.identificationCard(),
              inputType: TextInputType.text,
              controller: addressController,
              validator: RequiredValidator(errorText: 'Enter resident address'),
              // controller:,
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedFormField(
              hint: 'Password.',
              preffix: LineIcon.lock(),
              enabled: fieldsEnabled,
              inputType: TextInputType.visiblePassword,
              onChange: (v) {
                setState(() {});
              },
              controller: passwordController,
              validator: MultiValidator([
                RequiredValidator(errorText: 'Enter password'),
                MinLengthValidator(6,
                    errorText: 'Password must be up to 6 characters')
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            OutlinedFormField(
              hint: 'Confirm Password.',
              preffix: LineIcon.lock(),
              inputType: TextInputType.visiblePassword,
              enabled: fieldsEnabled,
              controller: confirmPasswordController,
              onChange: (v) {
                setState(() {});
              },
              validator: MultiValidator([
                RequiredValidator(errorText: 'Password mismatch'),
                ConfirmPasswordValidator(
                    errorText: 'Password mismatch',
                    comparedPassword: passwordController.text.toString())
              ]),
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
                onPressed: () {
                  // widget.onValidate();

                  if (validate(context)) {
                    bloc.add(RegisterEvent(payload));
                  }
                },
                child: BlocConsumer<AuthBloc, AuthState>(
                    bloc: bloc,
                    listener: (context, state) {
                      log(state.runtimeType.toString());
                      if (state is AuthFailureState) {
                        setState(() {
                          fieldsEnabled = true;
                        });
                        CustomSnackBar.show(context,
                            body: AuthErrorDialog(
                              errors: state.errors,
                            ),
                            backgroundColor: Colors.redAccent);
                      }
                      if (state is RegisterLoadingState) {
                        setState(() {
                          fieldsEnabled = false;
                        });
                      }
                      if (state is RegisterSuccessState) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const TransactionPinScreen(),
                        ));
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoadingState) {
                        return const CircularLoader();
                      } else {
                        return const Text('Create Account');
                      }
                    })),
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
                      const Text('Already have an account ?',style: TextStyle(color: Colors.grey),),
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
        ),
      ),
    );
  }

  bool validate(BuildContext context) {
    payload.password = passwordController.text.toString();
    payload.address = addressController.text.toString();
    payload.dateOfBirth = dob ?? DateTime.now();
    // payload.bvn = bvnController.text.toString();
    if (dob != null) {
      if (_formKey.currentState!.validate()) {
        return true;
      } else {
        return false;
      }
    } else {
      AppUtils.showCustomToast('Select Date Of Birth');
      return false;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
