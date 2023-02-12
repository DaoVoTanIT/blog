
import 'package:equatable/equatable.dart';

abstract class KpiEvent extends Equatable {
  const KpiEvent();

}
class GetKPIEvent extends KpiEvent {
  @override
  List<Object> get props => [];
}
