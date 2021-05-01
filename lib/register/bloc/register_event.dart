part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterWithEmailEvent extends RegisterEvent {
  final String email;
  final String password;

  RegisterWithEmailEvent({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
