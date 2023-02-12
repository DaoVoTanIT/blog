import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/feature/forgot_password/checkcode/bloc/check_code.dart';
import 'package:cmms/feature/forgot_password/repository/forgot_password_repository.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class CheckCodeBloc extends Bloc<CheckCodeEvent, CheckCodeState> {
  CheckCodeBloc() : super(CheckCodeInitial()) {
    on<CheckCodeAuthenticateEvent>((event, emit) async {
      try {
        emit(CheckCodeLoading());
        var forgotPasswordRepository =
            await GetIt.I.getAsync<ForgotPasswordRepository>();
        SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        String checkCapcha = await forgotPasswordRepository.checkcodeFotgotPass(
            event.userEnteredCaptchaCode, event.userName, event.code);
        if (checkCapcha == 'codeInvalid') {
          SmartDialog.dismiss();
          SmartDialog.showToast(
            LocaleKeys.capchaCodeIncorrect.tr(),
          );
        } else {
          SmartDialog.dismiss();
          NavigationService navigationService = NavigationService();
          navigationService.navigateTo(Routes.changePassSuccess);
        }
        SmartDialog.dismiss();
        emit(const CheckCodeSuccess());
      } catch (e) {
        print(e.toString());
        SmartDialog.dismiss();
        SmartDialog.showToast(
          LocaleKeys.capchaCodeIncorrect.tr(),
        );
        emit(CheckCodeFailure(error: e.toString()));
      }
    });
  }
}
