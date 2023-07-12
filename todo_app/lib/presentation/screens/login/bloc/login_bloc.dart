import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/core/app_status.dart';
import '../../../../domian/models/authentication_model.dart';
part 'login_event.dart';
part 'login_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial()) {
    on<OnLogInEvent>((event, emit) => {
          emit(LogInState(loginState: AppStatus.loading)),
          Future.delayed(const Duration(seconds: 10)),
          if (event.email == userDataInstance.email &&
              event.password == userDataInstance.password)
            {emit(LogInState(loginState: AppStatus.success))}
          else
            {emit(LogInState(loginState: AppStatus.failure))}
        });
  }
}
