import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class CheckCapchaEvent extends ForgotPasswordEvent {
  const CheckCapchaEvent(this.userName, this.userEnteredCaptchaCode);
  final String userName;
  final String userEnteredCaptchaCode;

  @override
  List<Object> get props => [];
}

class GetImageCapchaEvent extends ForgotPasswordEvent {
  GetImageCapchaEvent();
  @override
  List<Object> get props => [];
}
