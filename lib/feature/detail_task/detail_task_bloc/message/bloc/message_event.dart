import 'package:equatable/equatable.dart';
import 'package:cmms/common/model/message/message_model.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class GetListMessageEvent extends MessageEvent {
  const GetListMessageEvent({required this.id});
  final String id;
  @override
  List<Object> get props => [];
}

class CreateMessageEvent extends MessageEvent {
  const CreateMessageEvent({
    required this.model,
  });
  final MessageModel model;

  @override
  List<Object> get props => [];
}
