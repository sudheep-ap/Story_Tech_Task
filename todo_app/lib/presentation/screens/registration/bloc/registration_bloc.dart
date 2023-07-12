import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/core/app_status.dart';
import '../../../../domian/models/authentication_model.dart';
part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<OnRegistrationEvent>((event, emit) => {
          emit(RegistrationState(registrationState: AppStatus.loading)),
          Future.delayed(const Duration(seconds: 10)),
          User().registerUser(event.firstName, event.lastName, event.gender,
              event.email, event.password),
          emit(RegistrationState(registrationState: AppStatus.success))
        });
  }
}
