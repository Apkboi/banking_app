import 'dart:ui';
import 'package:banking_app/app/presentation/widgets/circular_loader.dart';
import 'package:banking_app/app/presentation/widgets/custom_button.dart';
import 'package:banking_app/app/presentation/widgets/outlined_form_field.dart';
import 'package:banking_app/core/di/injector.dart';
import 'package:banking_app/core/helpers/app_utils.dart';
import 'package:banking_app/features/auth/presentation/blocs/auth_blocs/auths_bloc.dart';
import 'package:banking_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:banking_app/features/auth/presentation/widgets/dialogs/auth_error_dialog.dart';
import 'package:banking_app/features/auth/presentation/widgets/dialogs/welcome_dialog.dart';
import 'package:banking_app/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:line_icons/line_icon.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool fieldsEnabled = true;
  final bloc = AuthBloc(injector.get());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AppUtils.showConfirmDialog(context);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
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
                    height: 20,
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
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedFormField(
                    hint: 'Enter your email address.',
                    preffix: LineIcon.mailBulk(color: Colors.grey,),
                    controller: emailController,
                    enabled: fieldsEnabled,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your email'),
                      EmailValidator(errorText: 'Invalid Email')
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedFormField(
                    hint: 'Password.',
                    preffix: LineIcon.lock(color: Colors.grey,),
                    enabled: fieldsEnabled,
                    onChange: (v) {
                      setState(() {});
                    },
                    controller: passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Enter your password'),
                      MinLengthValidator(6,
                          errorText: 'Password must be up to 6 characters')
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                      onPressed: fieldsEnabled ? () {
                        if (validate()) {
                          bloc.add(LoginEvent(
                              emailController.text, passwordController.text));
                        }

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const HomeScreen(),
                        //     ));
                      }:null,
                      child: BlocConsumer<AuthBloc, AuthState>(
                          bloc: bloc,
                          listener: _listenToLoginState,
                          builder: (context, state) {
                            if (state is LoginLoadingState) {
                              return const CircularLoader();
                            }

                            return const Text('Login');
                          })),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Don\'t have an account ?',style: TextStyle(color: Colors.grey),),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Register',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
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
          ),
        ),
      ),
    );
  }

  bool validate() {
    return _formKey.currentState!.validate();
  }

  void _listenToLoginState(BuildContext context, AuthState state) {

      if (state is LoginLoadingState) {
        setState(() {
          fieldsEnabled = false;
        });
      }
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
      if (state is LoginSuccessState) {
        setState(() {
          fieldsEnabled = true;
        });
        if (state.response.profile.completedProfile != 4) {
          showDialog(
            context: context,
            builder: (context) => BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 3,
                    sigmaY: 3,
                    tileMode: TileMode.repeated),
                child: Dialog(
                  backgroundColor: Theme.of(context).cardColor,
                    child: WelcomeDialog(
                        profile: state.response.profile))),
          );
        }else{
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        }
      }

  }

  bool isLoading(AuthState state){
    return state is LoginLoadingState;
  }
}
