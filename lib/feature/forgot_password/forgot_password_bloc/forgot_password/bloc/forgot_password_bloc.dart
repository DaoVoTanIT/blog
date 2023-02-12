import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/feature/forgot_password/forgot_password_bloc/forgot_password/bloc/forgot_password.dart';
import 'package:cmms/feature/forgot_password/repository/forgot_password_repository.dart';
import 'package:cmms/feature/forgot_password/screen/authenticate_forgot_password.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final BuildContext context;
  ForgotPasswordBloc(this.context) : super(ForgotPasswordInitial()) {
    on<CheckCapchaEvent>((event, emit) async {
      try {
        emit(ForgotPasswordLoading());
        var forgotPasswordRepository =
            await GetIt.I.getAsync<ForgotPasswordRepository>();
        SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        String checkCapcha =
            await forgotPasswordRepository.checkcaptraFotgotPass(
                event.userEnteredCaptchaCode, event.userName, '');
        if (checkCapcha == 'emailInvalid') {
          SmartDialog.dismiss();
          SmartDialog.showToast(
            LocaleKeys.capchaCodeIncorrect.tr(),
          );
        } else if (checkCapcha != 'captchaInvalid') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AuthenticateCodeForgotPassword(
                  userEnteredCaptchaCode: event.userEnteredCaptchaCode,
                  context: context,
                  userName: event.userName),
            ),
          );
        }
        SmartDialog.dismiss();
        emit(const ForgotPasswordSuccess());
      } catch (e) {
        print(e.toString());
        SmartDialog.dismiss();
        SmartDialog.showToast(
          LocaleKeys.capchaCodeIncorrect.tr(),
        );
        emit(ForgotPasswordFailure(error: e.toString()));
      }
    });
    on<GetImageCapchaEvent>((event, emit) async {
      try {
        emit(ForgotPasswordLoading());
        var forgotPasswordRepository =
            await GetIt.I.getAsync<ForgotPasswordRepository>();
        SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        final image = await forgotPasswordRepository.getImageCapcha();
        SmartDialog.dismiss();
        emit(GetCapChaSuccess(image));
      } catch (e) {
        print(e.toString());
        SmartDialog.dismiss();
        SmartDialog.showToast(
          LocaleKeys.capchaCodeIncorrect.tr(),
        );
        emit(ForgotPasswordFailure(error: e.toString()));
      }
    });
  }
}
