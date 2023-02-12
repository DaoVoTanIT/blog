import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/feature/login_signup/repository/login_repository.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';
import 'export.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<AuthenticateEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        var loginRepository = await GetIt.I.getAsync<LoginRepository>();
        //  SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        await loginRepository.authenticateUser(event.username, event.password);
        // SmartDialog.dismiss();
        NavigationService navigationService = NavigationService();
        navigationService.navigateTo(Routes.home);
        // Navigator.of(context).pushReplacementNamed(Routes.home);
        emit(const LoginSuccess());
      } catch (e) {
        // navigationService.pop('');
        SmartDialog.dismiss();
        SmartDialog.showToast(
          '${LocaleKeys.wrongAccountPassword.tr()} !',
        );
        emit(LoginFailure(error: e.toString()));
      }
    });
  }
}
