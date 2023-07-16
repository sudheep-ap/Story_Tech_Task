import 'package:flutter/material.dart';
import 'package:todo_app/presentation/screens/todo/todo_home.dart';
import '../../presentation/screens/login/sign_in_page.dart';
import '../../presentation/screens/registration/sign_up_page.dart';

Map<String, Widget Function(BuildContext)> router = {
  '/loginPage': (context) => const SignInPage(),
  '/registrationPage': (context) => const SignUpPage(),
  '/toDoHomePage': (context) => const ToDoHome(),
  '/addOrEditTaskPage': (context) => const ToDoHome(),
};
