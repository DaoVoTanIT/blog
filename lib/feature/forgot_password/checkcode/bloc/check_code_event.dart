import 'package:equatable/equatable.dart';

abstract class CheckCodeEvent extends Equatable {
  const CheckCodeEvent();
}

class CheckCodeAuthenticateEvent extends CheckCodeEvent {
  const CheckCodeAuthenticateEvent(
      {required this.userName,
      required this.userEnteredCaptchaCode,
      required this.code});
  final String userName;
  final String userEnteredCaptchaCode;
  final String code;
  @override
  List<Object> get props => [];
}
