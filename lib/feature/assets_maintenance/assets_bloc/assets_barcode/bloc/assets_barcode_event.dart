import 'package:equatable/equatable.dart';

abstract class AssetsBarcodeEvent extends Equatable {
  const AssetsBarcodeEvent();
}

class GetAssetsDetailByBarcodeEvent extends AssetsBarcodeEvent {
  final String barcode;

  const GetAssetsDetailByBarcodeEvent(this.barcode);
  @override
  List<Object?> get props => [barcode];
}
