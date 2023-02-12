part of 'check_notification_cubit.dart';

abstract class CheckNotificationState extends Equatable {
  const CheckNotificationState();
}

class CheckNotificationInitial extends CheckNotificationState {
  @override
  List<Object?> get props => [];
}

class CheckNotificationLoading extends CheckNotificationState {
  @override
  List<Object?> get props => [];
}

class CheckNotificationSuccess extends CheckNotificationState {
  const CheckNotificationSuccess({required this.listNotificationModel});
  final List<NotificationModel> listNotificationModel;
  @override
  List<Object?> get props => [listNotificationModel];
}

class CheckNotificationHomeSuccess extends CheckNotificationState {
  const CheckNotificationHomeSuccess({required this.listNotificationModel});
  final List<NotificationModel> listNotificationModel;
  @override
  List<Object?> get props => [listNotificationModel];
}

class CheckNotificationError extends CheckNotificationState {
  const CheckNotificationError({this.error});
  final String? error;
  @override
  List<Object> get props => [error!];
}
