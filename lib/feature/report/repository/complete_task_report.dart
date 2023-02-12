import 'package:dio/dio.dart';
import 'package:cmms/common/model/task/task_model.dart';

class CompleteTaskReportRepository {
  Dio client;

  CompleteTaskReportRepository({required this.client});
  late List<TaskModel> listReportCompleteModel = [];

  Future<List<TaskModel>> getListCompleteTaskReport() async {
    var todate = DateTime.now();
    var fromdate =
        DateTime(todate.year, todate.month - 3, todate.day); // 3 month ago
    final response = await client.post('/SystemMyTask.ctr/GetMyHistory/',
        queryParameters: {
          'fromDate': fromdate.toIso8601String(),
          'toDate': todate.toIso8601String()
        });
    listReportCompleteModel =
        (response.data as List).map((e) => TaskModel.fromJson(e)).toList();
    return listReportCompleteModel;
  }
}
