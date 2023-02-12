import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/model/task/task_model.dart';
import 'package:cmms/feature/report/bloc/complete_report/bloc/complete_task.dart';
import 'package:cmms/feature/report/repository/complete_task_report.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class CompleteTaskBloc extends Bloc<CompleteTaskEvent, CompleteTaskState> {
  CompleteTaskBloc() : super(const CompleteTaskInitial([])) {
    on<GetCompleteTaskEvent>((event, emit) async {
      try {
        emit(const CompleteTaskLoading([]));
        // listCompleteTaskMode.clear();
        var completeTaskReportRepository =
            await GetIt.I.getAsync<CompleteTaskReportRepository>();
        listReportCompleteModel =
            await completeTaskReportRepository.getListCompleteTaskReport();
        emit(CompleteTaskSuccess(listReportCompleteModel));
      } catch (e) {
        print(e);
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(CompleteTaskError(error: e.toString()));
      }
    });
  }
  List<TaskModel> listReportCompleteModel = [];
}
