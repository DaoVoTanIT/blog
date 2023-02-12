import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/feature/login_signup/login_signup_bloc/sign_up/bloc/sign_up.dart';
import 'package:cmms/feature/login_signup/repository/login_repository.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<CreateAccountEvent>((event, emit) async {
      try {
        emit(SignUpLoading());
        var repo = await GetIt.I.getAsync<LoginRepository>();
        SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        await repo.createAccount(event.userName, event.password);
        SmartDialog.dismiss();
        NavigationService navigationService = NavigationService();
        navigationService.navigateTo(Routes.login);
        emit(const SignUpSuccess());
      } catch (e) {
        // navigationService.pop('');
        SmartDialog.dismiss();
        SmartDialog.showToast(
          'Lỗi',
        );
        emit(SignUpFailure(error: e.toString()));
      }
    });
  }
}
