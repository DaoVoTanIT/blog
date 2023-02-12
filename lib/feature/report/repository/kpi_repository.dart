import 'package:dio/dio.dart';
import 'package:cmms/common/model/kpi/kpi_model.dart';

class KPIRepository {
  Dio client;

  KPIRepository({required this.client});
  late KpiModel kpiModel;
  Future<KpiModel> getKPIReport() async {
    final response = await client.get(
      '/SystemReportKPIUser.ctr/getKPIMyUser/',
    );
    kpiModel = KpiModel.fromJson(response.data);
    return kpiModel;
  }
}
