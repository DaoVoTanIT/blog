import 'package:equatable/equatable.dart';

class NotificationItemModel extends Equatable {
  const NotificationItemModel({
    this.isUnread = false,
    this.status,
    // this.patient,
    this.time,
    this.notificationTime,
    required this.type,
  });
  final dynamic type;
  final dynamic status;
  //final PatientModel? patient;
  final String? time;
  final String? notificationTime;
  final bool isUnread;

  @override
  List<Object?> get props => [type, status, time, notificationTime];
}
