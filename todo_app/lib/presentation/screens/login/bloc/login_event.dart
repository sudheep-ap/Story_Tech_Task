part of 'login_bloc.dart';

@immutable
abstract class LogInEvent {}

class OnLogInEvent extends LogInEvent {
  final String email;
  final String password;

  OnLogInEvent(this.email, this.password);
}
