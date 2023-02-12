
import 'package:equatable/equatable.dart';

abstract class CompleteTaskEvent extends Equatable {
  const CompleteTaskEvent();
}
class GetCompleteTaskEvent extends CompleteTaskEvent {
  @override
  List<Object> get props => [];
}
