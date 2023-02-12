import 'package:equatable/equatable.dart';
import 'package:cmms/common/model/message/message_model.dart';

abstract class MessageState extends Equatable {
  final List<MessageModel> listMessageModel;

  const MessageState(this.listMessageModel);
}

class MessageInitial extends MessageState {
  const MessageInitial(super.listMessageModel);

  @override
  List<Object> get props => [listMessageModel];
}

class MessageSuccess extends MessageState {
  const MessageSuccess(super.listMessageModel);

  @override
  List<Object> get props => [listMessageModel];
}

class MessageLoading extends MessageState {
  const MessageLoading(super.listMessageModel);

  @override
  List<Object> get props => [listMessageModel];
}

class MessageError extends MessageState {
  MessageError({this.error}) : super([]);
  final String? error;
  @override
  List<Object> get props => [error!];
}
