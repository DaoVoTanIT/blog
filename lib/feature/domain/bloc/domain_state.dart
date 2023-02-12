import 'package:equatable/equatable.dart';

abstract class DomainState extends Equatable {
  const DomainState();
}

class DomainInitial extends DomainState {
  @override
  List<Object> get props => [];
}

class DomainLoading extends DomainState {
  @override
  List<Object> get props => [];
}

class DomainSuccess extends DomainState {
  @override
  List<Object> get props => [];
}

class DomainFailure extends DomainState {
  const DomainFailure({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
