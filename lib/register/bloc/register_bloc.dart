import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:proyectoM/auth/user_auth_provider.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  // auth provider
  UserAuthProvider _authProvider = UserAuthProvider();
  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterWithEmailEvent) {
      try {
        yield RegisterLoadingState();
        await _authProvider.createUserWithEmailAndPassword(
            event.email, event.password);
        yield RegisterSuccessState();
      } catch (e) {
        yield RegisterErrorState(error: e.code);
      }
    }
  }
}
