import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/model/checklist/check_list.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/checklist/bloc/checklist.dart';
import 'package:cmms/feature/detail_task/repository/checklist_repository.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  ChecklistBloc() : super(const ChecklistInitial([])) {
    on<GetChecklistEvent>((event, emit) async {
      try {
        emit(const ChecklistInitial([]));
        var loginRepository = await GetIt.I.getAsync<ChecklistRepository>();
        // SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        listChecklist = await loginRepository.getListChecklist(event.id);
        emit(ChecklistSuccess(listChecklist));
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(ChecklistError(error: e.toString()));
      }
    });
    on<ChecklistsEvent>((event, emit) async {
      try {
        emit(const ChecklistLoading([]));
        var loginRepository = await GetIt.I.getAsync<ChecklistRepository>();
        // SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        await loginRepository.updateChecklist(event.idChecklist);
        var indexSelectedCheck = listChecklist
            .indexWhere((element) => element.db!.id == event.idChecklist);
        listChecklist[indexSelectedCheck].db!.statusFinish =
            !listChecklist[indexSelectedCheck].db!.statusFinish!;
        emit(ChecklistSuccess(listChecklist));
      } catch (e) {
        emit(ChecklistError(error: e.toString()));
      }
    });
    on<CreateCheckListEvent>((event, emit) async {
      try {
        emit(const ChecklistLoading([]));
        var loginRepository = await GetIt.I.getAsync<ChecklistRepository>();
        // SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        var checklist = await loginRepository.createCheckList(event.model);
        listChecklist.add(checklist);
        emit(ChecklistSuccess(listChecklist));
      } catch (e) {
        emit(ChecklistError(error: e.toString()));
      }
    });
  }
  List<CheckListModel> listChecklist = [];
}
