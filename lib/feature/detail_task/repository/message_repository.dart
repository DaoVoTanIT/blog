import 'package:dio/dio.dart';
import 'package:cmms/common/model/message/message_model.dart';

class MessageRepository {
  Dio client;

  MessageRepository({required this.client});
  late List<MessageModel> listMessageModel = [];
  late MessageModel messageModel;
  Future<List<MessageModel>> getListMessage(String id) async {
    try {
      final response = await client
          .get('/SystemTask.ctr/GetCommentItem/', queryParameters: {'id': id});
      listMessageModel =
          (response.data as List).map((e) => MessageModel.fromJson(e)).toList();
      listMessageModel.sort(
        (a, b) => b.db!.dateSend!.compareTo(a.db!.dateSend!),
      );
      return listMessageModel;
    } on DioError catch (ex) {
      print(ex);
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }

  Future<MessageModel> createMessage(MessageModel model) async {
    try {
      final response = await client.post('/SystemTask.ctr/CreateComment/',
          data: model.toJson());
      messageModel = MessageModel.fromJson(response.data);

      return messageModel;
    } on DioError catch (ex) {
      print(ex);
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }
}
