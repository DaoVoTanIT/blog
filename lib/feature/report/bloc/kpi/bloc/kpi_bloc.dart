import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/feature/report/bloc/kpi/bloc/kpi.dart';
import 'package:cmms/feature/report/repository/kpi_repository.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class KpiBloc extends Bloc<KpiEvent, KpiState> {
  KpiBloc() : super(KpiInitial()) {
    on<GetKPIEvent>((event, emit) async {
      try {
        emit(KpiLoading());
        var loginRepository = await GetIt.I.getAsync<KPIRepository>();
        final installation = await loginRepository.getKPIReport();
        emit(KpiSuccess(installation));
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');

        emit(KpiError(error: e.toString()));
      }
    });
  }
}
