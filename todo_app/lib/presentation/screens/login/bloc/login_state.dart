// ignore_for_file: prefer_typing_uninitialized_variables

part of 'login_bloc.dart';

class LogInState {
  final loginState;
  LogInState({required this.loginState});
}

class LogInInitial extends LogInState {
  LogInInitial() : super(loginState: AppStatus.initial);
}
