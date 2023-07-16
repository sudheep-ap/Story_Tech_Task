import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/presentation/screens/login/bloc/login_bloc.dart';
import 'package:todo_app/presentation/screens/login/sign_in_page.dart';
import 'package:todo_app/presentation/screens/registration/bloc/registration_bloc.dart';
import 'package:todo_app/presentation/screens/registration/sign_up_page.dart';
import 'package:todo_app/presentation/screens/todo/bloc/todo_bloc.dart';
import 'package:todo_app/presentation/screens/todo/todo_home.dart';
import 'data/core/constants.dart';
import 'data/core/router.dart';
import 'data/db/functions/db_functions.dart';

String custFirstName = '';
String custLastName = '';
String custGender = '';
String custEmail = '';
String custPassword = '';
bool isCustLogin = false;
List custTodoList = [];

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('loginDb');
  await Hive.openBox('checkLoginDb');
  await Hive.openBox('todoDb');
  await checkLogin();
  await getUserDetails();
  // clearTodoList();
  await getTodoList();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
    routes: router,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LogInBloc>(create: (context) => LogInBloc()),
        BlocProvider<RegistrationBloc>(create: (context) => RegistrationBloc()),
        BlocProvider<ToDoBloc>(create: (context) => ToDoBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors().kBgTealColor,
              secondary: AppColors().kMainBlackColor,
              onPrimary: AppColors().kMainBlackColor),
        ),
        home: !isCustLogin
            ? custEmail.isEmpty
                ? const SignUpPage()
                : const SignInPage()
            : const ToDoHome(),
        routes: router,
      ),
    );
  }
}
