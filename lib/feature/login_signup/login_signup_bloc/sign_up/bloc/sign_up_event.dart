import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class CreateAccountEvent extends SignUpEvent {
  const CreateAccountEvent(this.userName, this.password);
  final String userName;
  final String password;
  @override
  List<Object> get props => [];
}
