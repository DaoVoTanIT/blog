import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/model/message/message_model.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/message/bloc/message.dart';
import 'package:cmms/feature/detail_task/repository/message_repository.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(const MessageInitial([])) {
    on<GetListMessageEvent>((event, emit) async {
      try {
        emit(const MessageInitial([]));
        listMessageModel.clear();
        var loginRepository = await GetIt.I.getAsync<MessageRepository>();
        // SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        listMessageModel = await loginRepository.getListMessage(event.id);
        emit(MessageSuccess(listMessageModel));
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(MessageError(error: e.toString()));
      }
    });
    on<CreateMessageEvent>((event, emit) async {
      try {
        emit(const MessageLoading([]));
        var loginRepository = await GetIt.I.getAsync<MessageRepository>();
        // SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        var message = await loginRepository.createMessage(event.model);
        listMessageModel.insert(0, message);

        emit(MessageSuccess(listMessageModel));
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');

        emit(MessageError(error: e.toString()));
      }
    });
  }
  List<MessageModel> listMessageModel = [];
}
