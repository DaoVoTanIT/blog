import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:dio/dio.dart';

class AssetsRepository {
  Dio client;
  AssetsRepository({required this.client});
  late AssetsModel assetsModel;
  Future<AssetsModel> getAllAssets() async {
    try {
      final response = await client.get(
        '/api/CmmsAsset/GetAllAssetByGroup',
      );
      assetsModel = AssetsModel.fromJson(response.data);
      assetsModel.data.where((element) =>
          element.db.deleteStatusFlag == 'N' && element.db.activeFlag == 'Y');
      return assetsModel;
    } on DioError catch (ex) {
      print(ex.response.toString());
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }

  Future<AssetsDb> getAssetsDetailByBarcode(String barcode) async {
    try {
      final response = await client.get(
        '/api/CmmsAsset/GetAssetDetailByBarcode/$barcode',
      );
      var res = AssetsDb.fromJson(response.data['data']);

      return res;
    } on DioError catch (ex) {
      print(ex.response.toString());
      String errorMessage = ex.response.toString();
      throw Exception(errorMessage);
    }
  }
}
