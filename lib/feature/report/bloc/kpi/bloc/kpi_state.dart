import 'package:equatable/equatable.dart';
import 'package:cmms/common/model/kpi/kpi_model.dart';

abstract class KpiState extends Equatable {
  const KpiState();

  @override
  List<Object> get props => [];
}

class KpiInitial extends KpiState {}

class KpiLoading extends KpiState {}

class KpiSuccess extends KpiState {
  final KpiModel kpiModel;
  const KpiSuccess(this.kpiModel);
}

class KpiError extends KpiState {
  const KpiError({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}
