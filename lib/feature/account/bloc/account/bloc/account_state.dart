import 'package:cmms/common/model/user/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {
  final UserModel userdbModel;
  const AccountLoaded(this.userdbModel);
}

class AccountError extends AccountState {
  const AccountError({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}
