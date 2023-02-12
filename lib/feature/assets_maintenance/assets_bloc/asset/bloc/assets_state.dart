import 'package:cmms/common/model/assets/assets_model.dart';
import 'package:equatable/equatable.dart';

abstract class AssetsState extends Equatable {
  const AssetsState();
  @override
  List<Object> get props => [];
}

class AssetsInitial extends AssetsState {}

class AssetsLoading extends AssetsState {}

class AssetsSucsses extends AssetsState {
  const AssetsSucsses(this.assetsModel);
  final AssetsModel assetsModel;
}

class AssetsError extends AssetsState {
  const AssetsError({this.error}) : super();
  final String? error;
  @override
  List<Object> get props => [error!];
}
