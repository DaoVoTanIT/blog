
import 'package:equatable/equatable.dart';

abstract class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoading extends ChangePasswordState {}

class ChangePasswordSuccess extends ChangePasswordState {
  // final UserdbModel userdbModel;
  const ChangePasswordSuccess();
}

class ChangePasswordError extends ChangePasswordState {
  const ChangePasswordError({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}
