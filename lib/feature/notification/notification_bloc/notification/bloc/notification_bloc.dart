import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/model/notification/NotificationModel.dart';
import 'package:cmms/feature/notification/notification_bloc/notification/bloc/notification.dart';
import 'package:cmms/feature/notification/repository/notification.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationInitial([])) {
    NotificationRepository notificationRepository = NotificationRepository();
    on<NotificationEvent>((event, emit) async {
      try {
        emit(const NotificationInitial([]));
        //  SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        listNotificationModel = await notificationRepository.getNotification();
        var numNoti =
            listNotificationModel.where((element) => element.status == 1);
        FlutterAppBadger.updateBadgeCount(numNoti.length);
        //  SmartDialog.dismiss();
        emit(NotificationSuccess(listNotificationModel));
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(NotificationError(error: e.toString()));
      }
    });
    on<ReadNotificationEvent>((event, emit) async {
      try {
        emit(const NotificationInitial([]));
        await notificationRepository.readNotification(event.status, event.id);
        var numNoti =
            listNotificationModel.where((element) => element.status == 1);
        FlutterAppBadger.updateBadgeCount(numNoti.length);
        emit(NotificationSuccess(listNotificationModel));
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(NotificationError(error: e.toString()));
      }
    });
  }
  List<NotificationModel> listNotificationModel = [];
}
