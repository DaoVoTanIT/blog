import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  const SignUpSuccess();
  @override
  List<Object> get props => [];
}

class SignUpFailure extends SignUpState {
  const SignUpFailure({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}
