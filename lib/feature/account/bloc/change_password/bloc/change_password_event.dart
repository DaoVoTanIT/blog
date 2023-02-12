
import 'package:equatable/equatable.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
}

class ChangePassEvent extends ChangePasswordEvent {
  final String oldPassword;
  final String password;

  const ChangePassEvent(this.oldPassword, this.password);
  @override
  List<Object?> get props => [];
}
