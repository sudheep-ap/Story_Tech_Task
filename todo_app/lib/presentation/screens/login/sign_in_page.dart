// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/presentation/screens/login/bloc/login_bloc.dart';
import '../../../data/core/app_status.dart';
import '../../../data/core/common_functions.dart';
import '../../../data/core/common_widgets.dart';
import '../../../data/core/constants.dart';
import '../../widgets/textFiled_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool obscurePass = true;
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios_sharp))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors().kTextGreyColor,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        TextFieldWidget(
                          controller: userEmail,
                          hintText: 'Email',
                          validatorMessage: 'Please enter your email',
                          prefixIcon: Icons.email_outlined,
                        ),
                        kSizedBox20,
                        TextFieldWidget(
                          controller: userPassword,
                          hintText: 'Password',
                          validatorMessage: 'Please enter your password',
                          prefixIcon: Icons.password_rounded,
                          isPassword: true,
                        ),
                        const SizedBox(height: 80),
                        BlocListener<LogInBloc, LogInState>(
                            listener: (context, state) {
                              switch (state.loginState) {
                                case AppStatus.loading:
                                  showLinearLoading(context, true, false);

                                  break;
                                case AppStatus.success:
                                  Navigator.pop(context);

                                  showSnackBar(
                                      context,
                                      'Logged In Successfully',
                                      AppColors().kSnackBarSuccessColor);
                                  //Navigate to home screen
                                  Navigator.pushNamed(context, '/toDoHomePage');

                                  break;
                                case AppStatus.failure:
                                  Navigator.pop(context);
                                  showSnackBar(
                                      context,
                                      'Invalid email/password',
                                      AppColors().kSnackBarErrorColor);

                                  break;
                                default:
                              }
                            },
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<LogInBloc>().add(OnLogInEvent(
                                      userEmail.text.trim(),
                                      userPassword.text.trim()));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors().kButtonTealColor,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  padding: const EdgeInsets.fromLTRB(
                                      18, 18, 18, 15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Sign In',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                          color: Colors.white)),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 45)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
