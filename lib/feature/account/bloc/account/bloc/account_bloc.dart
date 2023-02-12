import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/feature/account/bloc/account/bloc/account.dart';
import 'package:cmms/feature/account/repository/account_repository.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial()) {
    on<GetInformationUserEvent>((event, emit) async {
      try {
        emit(AccountLoading());
        var loginRepository = await GetIt.I.getAsync<AccountRepository>();
        final userInfor = await loginRepository.getInformationUser();
        emit(AccountLoaded(userInfor!));
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(AccountError(error: e.toString()));
      }
    });
  }
}
