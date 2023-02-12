import 'package:equatable/equatable.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class GetNotificationEvent extends NotificationEvent {
  @override
  List<Object?> get props => [];
}

class ReadNotificationEvent extends NotificationEvent {
  final int status;
  final String id;

  const ReadNotificationEvent(this.status, this.id);
  @override
  List<Object?> get props => [];
}
