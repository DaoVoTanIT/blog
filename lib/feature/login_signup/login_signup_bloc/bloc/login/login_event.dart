import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class AuthenticateEvent extends LoginEvent {
  const AuthenticateEvent(this.username, this.password);
  final String username;
  final String password;
  @override
  List<Object> get props => [];
}
