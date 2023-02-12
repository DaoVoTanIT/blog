import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:cmms/feature/assets_maintenance/assets_bloc/asset/bloc/assets.dart';
import 'package:cmms/feature/assets_maintenance/repository/assets_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  AssetsBloc() : super(AssetsInitial()) {
    on<GetAllAssetsEvent>((event, emit) async {
      try {
        emit(AssetsLoading());
        SmartDialog.showLoading(msg: 'Loading');
        var repo = await GetIt.I.getAsync<AssetsRepository>();
        assetsModel = await repo.getAllAssets();
        SmartDialog.dismiss();
        emit(AssetsSucsses(assetsModel));
      } catch (e) {
        print(e.toString());
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(AssetsError(error: e.toString()));
      }
    });
    on<FilterAssetsEvent>((event, emit) async {
      try {
        emit(AssetsLoading());
        AssetsModel assets = AssetsModel(data: []);
        assets.data.addAll(assetsModel.data);
        if (event.contentSearch.isNotEmpty) {
          assets.data.retainWhere((ass) {
            String? searchTerm = event.contentSearch.toLowerCase();
            if ((ass.db.assetCode).toLowerCase().contains(searchTerm)) {
              return true;
            }
            if ((ass.db.assetCode).contains(searchTerm)) {
              return true;
            }
            return false;
          });
        }
        emit(AssetsSucsses(assets));
      } catch (e) {
        print(e.toString());
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(AssetsError(error: e.toString()));
      }
    });
  }
  AssetsModel assetsModel = AssetsModel(data: []);
}
