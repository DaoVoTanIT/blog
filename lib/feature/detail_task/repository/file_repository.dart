import 'package:dio/dio.dart';
import 'package:cmms/common/model/message/message_model.dart';
import 'package:cmms/common/model/task/task_model.dart';

class FileRepository {
  Dio client;

  FileRepository({required this.client});
  late List<MessageModel> listMessageModel = [];
  late MessageModel messageModel;
  late TaskModel taskModel;

  Future<void> removeFile(String idFile) async {
    await client.delete('/SystemTask.ctr/RemoveFileUpload/',
        queryParameters: {'id': idFile});
  }

  Future<TaskModel> uploadFile(FormData formData) async {
    try {
      Response res =
          await client.post('/SystemTask.ctr/UploadFile/', data: formData);
      taskModel = TaskModel.fromJson(res.data);
      return taskModel;
    } on DioError catch (ex) {
      print(ex);
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }
}
