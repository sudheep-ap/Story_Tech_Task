// ignore_for_file: prefer_typing_uninitialized_variables

part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class OnRegistrationEvent extends RegistrationEvent {
  final firstName;
  final lastName;
  final gender;
  final email;
  final password;

  OnRegistrationEvent(
      {this.firstName, this.lastName, this.gender, this.email, this.password});
}
