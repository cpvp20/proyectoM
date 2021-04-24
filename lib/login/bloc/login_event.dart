part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithGoogleEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginAnonymousEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}

class LoginWithEmailEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmailEvent({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}

class ForgotPasswordEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
