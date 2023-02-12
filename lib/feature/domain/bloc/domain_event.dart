
import 'package:equatable/equatable.dart';

abstract class DomainEvent extends Equatable {
  const DomainEvent();

}
class InitialDomainEvent extends DomainEvent {
  @override
  List<Object> get props => [];
}

class CheckDomainEvent extends DomainEvent {
  const CheckDomainEvent({required this.domain});
  final String domain;
  @override
  List<Object> get props => [domain];
}