import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/model/notification/NotificationModel.dart';
import 'package:cmms/feature/notification/repository/notification.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';
part 'check_notification_state.dart';

class CheckNotificationCubit extends Cubit<CheckNotificationState> {
  CheckNotificationCubit() : super(CheckNotificationInitial()) {
    getListNotification();
  }
  Future<List<NotificationModel>> getListNotification() async {
    try {
      emit(CheckNotificationLoading());
      var repo = await GetIt.I.getAsync<NotificationRepository>();
      listNotificationModel = await repo.getNotification();
      emit(CheckNotificationSuccess(
          listNotificationModel: listNotificationModel));
    } catch (e) {
      SmartDialog.dismiss();
      SmartDialog.showToast('Error');
      emit(CheckNotificationError(error: e.toString()));
    }
    return listNotificationModel;
  }

  List<NotificationModel> listNotificationModel = [];
}
