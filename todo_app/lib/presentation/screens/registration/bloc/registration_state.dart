part of 'registration_bloc.dart';

class RegistrationState {
  final AppStatus registrationState;
  RegistrationState({this.registrationState = AppStatus.initial});
}

class RegistrationInitial extends RegistrationState {
  RegistrationInitial() : super(registrationState: AppStatus.initial);
}
