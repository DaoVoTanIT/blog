import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:equatable/equatable.dart';

abstract class AssetsBarcodeState extends Equatable {
  const AssetsBarcodeState();

  @override
  List<Object> get props => [];
}

class AssetsBarcodeInitial extends AssetsBarcodeState {}

class AssetsBarcodeLoading extends AssetsBarcodeState {}

class AssetsBarcodeSucsses extends AssetsBarcodeState {
  const AssetsBarcodeSucsses(this.assetsDb);
  final AssetsDb assetsDb;
}

class AssetsBarcodeError extends AssetsBarcodeState {
  const AssetsBarcodeError({this.error}) : super();
  final String? error;
  @override
  List<Object> get props => [error!];
}
