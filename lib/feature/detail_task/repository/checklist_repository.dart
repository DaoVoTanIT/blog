import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:cmms/common/model/checklist/check_list.dart';

class ChecklistRepository {
  Dio client;

  ChecklistRepository({required this.client});
  late List<CheckListModel> listChecklistModel = [];
  late CheckListModel checkListModel;
  Future<List<CheckListModel>> getListChecklist(String id) async {
    final response = await client
        .get('/SystemTask.ctr/GetToDoListItem/', queryParameters: {'id': id});
    listChecklistModel =
        (response.data as List).map((e) => CheckListModel.fromJson(e)).toList();
    return listChecklistModel;
  }

  Future<CheckListModel> updateChecklist(String idChecklist) async {
    try {
      final response = await client.get('/SystemTask.ctr/CheckTodolist/',
          queryParameters: {'id': idChecklist});
      checkListModel = CheckListModel.fromJson(response.data);
      return checkListModel;
    } on DioError catch (ex) {
      print(ex);
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }

  Future<CheckListModel> createCheckList(CheckListModel model) async {
    try {
      var a = json.encode(model);
      final response = await client.post('/SystemTask.ctr/CreateTodolist/',
          data: model.toJson());
      checkListModel = CheckListModel.fromJson(response.data);

      return checkListModel;
    } on DioError catch (ex) {
      print(ex);
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }
}
