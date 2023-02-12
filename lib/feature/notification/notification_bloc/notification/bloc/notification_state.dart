import 'package:equatable/equatable.dart';
import 'package:cmms/common/model/notification/NotificationModel.dart';

abstract class NotificationState extends Equatable {
  const NotificationState(this.listNotificationModel);
  final List<NotificationModel> listNotificationModel;

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {
  const NotificationInitial(super.listNotificationModel);
}

class NotificationLoading extends NotificationState {
  const NotificationLoading(super.listNotificationModel);
}

class NotificationSuccess extends NotificationState {
  const NotificationSuccess(super.listNotificationModel);
}

class NotificationError extends NotificationState {
  NotificationError({this.error}) : super([]);
  final String? error;
  @override
  List<Object> get props => [error!];
}
