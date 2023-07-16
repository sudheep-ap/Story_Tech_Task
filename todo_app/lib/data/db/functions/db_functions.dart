import 'package:hive_flutter/hive_flutter.dart';
import '../../../main.dart';

//To add user Details
Future<void> addUserDetails(String userFirstName, String userLastName,
    String userGender, String userEmail, String userPassword) async {
  final loginDb = Hive.box('loginDb');
  loginDb.put('userFirstNameKey', userFirstName);
  loginDb.put('userLastNameKey', userLastName);
  loginDb.put('userGenderKey', userGender);
  loginDb.put('userEmailKey', userEmail);
  loginDb.put('userPasswordKey', userPassword);
  custFirstName = userFirstName;
  custLastName = userLastName;
  custGender = userGender;
  custEmail = userEmail;
  custPassword = userPassword;

  print('custFirstName : $custFirstName');
  print('custLastName : $custLastName');
  print('custGender : $custGender');
  print('custEmail : $custEmail');
  print('custPassword: $custPassword');
}

// To fetch user Details
Future<void> getUserDetails() async {
  final loginDb = Hive.box('loginDb');
  final userFirstName = loginDb.get('userFirstNameKey');
  final userLastName = loginDb.get('userLastNameKey');
  final userGender = loginDb.get('userGenderKey');
  final userEmail = loginDb.get('userEmailKey');
  final userPassword = loginDb.get('userPasswordKey');
  custFirstName = userFirstName ?? '';
  custLastName = userLastName ?? '';
  custGender = userGender ?? '';
  custEmail = userEmail ?? '';
  custPassword = userPassword ?? '';

  print('custFirstName : $custFirstName');
  print('custLastName : $custLastName');
  print('custGender : $custGender');
  print('custEmail : $custEmail');
  print('custPassword: $custPassword');
}

//When user logged in successfully
Future<void> setLoginTrue() async {
  final loginDb = Hive.box('checkLoginDb');
  loginDb.put('checkLoginKey', true);
  isCustLogin = true;
}

//To check if user is logged In or not
Future<void> checkLogin() async {
  final loginDb = Hive.box('checkLoginDb');
  final userCheckLogin = loginDb.get('checkLoginKey') ?? false;
  if (userCheckLogin == false) {
    isCustLogin = false;
  } else {
    isCustLogin = true;
  }
  print('isLogin :$isCustLogin');
}

//  Add Todo list
Future<void> addToList(List todoList) async {
  final todoDb = Hive.box('todoDb');
  todoDb.put('userTodoListKey', todoList);

  custTodoList = todoList;

  print('custTodoList : $custTodoList');
}

//To fetch ToDo list
Future<void> getTodoList() async {
  final todoDb = Hive.box('todoDb');

  final userTodoList = todoDb.get('userTodoListKey') ?? [];
  print(userTodoList);
  custTodoList = userTodoList;
  print('custTodoList : $custTodoList');
}

//Clear todo list

Future<void> clearTodoList() async {
  final todoDb = Hive.box('todoDb');
  await todoDb.delete('userTodoListKey');
  print('custTodoList : $custTodoList');
}

// To clear local db when user logs out
Future<void> clearUserDetails() async {
  final loginDb = Hive.box('loginDb');
  final checkLoginDB = Hive.box('checkLoginDb');
  final todoDb = Hive.box('todoDb');

  await loginDb.delete('userFirstNameKey');
  await loginDb.delete('userLastNameKey');
  await loginDb.delete('userGenderKey');
  await loginDb.delete('userEmailKey');
  await loginDb.delete('userPasswordKey');
  await checkLoginDB.delete('checkLoginKey');
  await todoDb.delete('userTodoListKey');
  getUserDetails();
  checkLogin();
}
