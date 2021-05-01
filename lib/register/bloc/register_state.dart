part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessState extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterErrorState extends RegisterState {
  final String error;
  final String code;

  RegisterErrorState({@required this.error, this.code = "to be defined code"});

  @override
  List<Object> get props => [error, code];
}
