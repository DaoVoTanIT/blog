import 'package:equatable/equatable.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
}

class GetInformationUserEvent extends AccountEvent {
  @override
  List<Object?> get props => [];
}
