import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/feature/account/bloc/change_password/bloc/change_passord.dart';
import 'package:cmms/feature/account/repository/account_repository.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitial()) {
    on<ChangePassEvent>((event, emit) async {
      try {
        emit(ChangePasswordLoading());
        var changePaswordRepository =
            await GetIt.I.getAsync<AccountRepository>();
        SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        await changePaswordRepository.changePassword(
            event.oldPassword, event.password);
        SmartDialog.dismiss();
        SmartDialog.showToast(LocaleKeys.changePasswordSuccessfully.tr());
        Future.delayed(const Duration(seconds: 1), () {});
        SmartDialog.dismiss();
        NavigationService navigationService = NavigationService();
        navigationService.navigateTo(Routes.home);
        emit(const ChangePasswordSuccess());
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(ChangePasswordError(error: e.toString()));
      }
    });
  }
}
