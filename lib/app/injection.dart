import 'package:cmms/feature/assets_maintenance/repository/assets_repository.dart';
import 'package:dio/dio.dart';
import 'package:cmms/common/config/dio_client.dart';
import 'package:cmms/common/config/navigation_service.dart';
import 'package:cmms/feature/account/repository/account_repository.dart';
import 'package:cmms/feature/detail_task/repository/file_repository.dart';
import 'package:cmms/feature/detail_task/repository/message_repository.dart';
import 'package:cmms/feature/domain/repository/domain_repository.dart';
import 'package:cmms/feature/detail_task/repository/checklist_repository.dart';
import 'package:cmms/feature/forgot_password/repository/forgot_password_repository.dart';
import 'package:cmms/feature/login_signup/repository/login_repository.dart';
import 'package:cmms/feature/report/repository/complete_task_report.dart';
import 'package:cmms/feature/report/repository/kpi_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerFactoryAsync<Dio>(DioClient().createAsync);
  getIt.registerLazySingletonAsync<SharedPreferences>(
      SharedPreferences.getInstance);
  getIt.registerSingletonAsync<DomainRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return DomainRepository(client: dio);
  });
  getIt.registerFactoryAsync<LoginRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return LoginRepository(client: dio);
  });
  getIt.registerFactoryAsync<AccountRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return AccountRepository(client: dio);
  });

  getIt.registerFactoryAsync<ChecklistRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return ChecklistRepository(client: dio);
  });
  getIt.registerFactoryAsync<MessageRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return MessageRepository(client: dio);
  });
  getIt.registerFactoryAsync<FileRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return FileRepository(client: dio);
  });

  getIt.registerFactoryAsync<KPIRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return KPIRepository(client: dio);
  });
  getIt.registerFactoryAsync<CompleteTaskReportRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return CompleteTaskReportRepository(client: dio);
  });

  getIt.registerSingletonAsync<ForgotPasswordRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return ForgotPasswordRepository(client: dio);
  });
  getIt.registerFactoryAsync<AssetsRepository>(() async {
    await getIt.isReady<SharedPreferences>();
    final dio = await getIt.getAsync<Dio>();
    return AssetsRepository(client: dio);
  });
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}
