import 'package:equatable/equatable.dart';

abstract class AssetsEvent extends Equatable {
  const AssetsEvent();
}

class GetAllAssetsEvent extends AssetsEvent {
  @override
  List<Object?> get props => [];
}

class FilterAssetsEvent extends AssetsEvent {
  final String contentSearch;

  const FilterAssetsEvent(this.contentSearch);
  @override
  List<Object?> get props => [];
}
