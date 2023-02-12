import 'package:cmms/feature/assets_maintenance/assets_bloc/assets_barcode/bloc/assets_barcode.dart';
import 'package:cmms/feature/assets_maintenance/repository/assets_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class AssetsBarcodeBloc extends Bloc<AssetsBarcodeEvent, AssetsBarcodeState> {
  AssetsBarcodeBloc() : super(AssetsBarcodeInitial()) {
    on<GetAssetsDetailByBarcodeEvent>((event, emit) async {
      try {
        emit(AssetsBarcodeLoading());
        SmartDialog.showLoading(msg: 'Loading');
        var repo = await GetIt.I.getAsync<AssetsRepository>();
        if (event.barcode != '-1') {
          var res = await repo.getAssetsDetailByBarcode(event.barcode);
          SmartDialog.dismiss();
          emit(AssetsBarcodeSucsses(res));
        } else {
          SmartDialog.dismiss();
          emit(const AssetsBarcodeError(error: ''));
        }
      } catch (e) {
        print(e.toString());
        SmartDialog.dismiss();
        SmartDialog.showToast('Barcode không hợp lệ');
        emit(AssetsBarcodeError(error: e.toString()));
      }
    });
  }
}
