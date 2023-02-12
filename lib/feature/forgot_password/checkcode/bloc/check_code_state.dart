import 'package:equatable/equatable.dart';

abstract class CheckCodeState extends Equatable {
  const CheckCodeState();

  @override
  List<Object> get props => [];
}

class CheckCodeInitial extends CheckCodeState {}

class CheckCodeLoading extends CheckCodeState {}

class CheckCodeSuccess extends CheckCodeState {
  const CheckCodeSuccess();
  @override
  List<Object> get props => [];
}

class CheckCodeFailure extends CheckCodeState {
  const CheckCodeFailure({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}
