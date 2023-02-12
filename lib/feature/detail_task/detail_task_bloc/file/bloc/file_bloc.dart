import 'dart:convert';
import 'dart:io';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/model/file_upload/file_upload.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/file/bloc/file.dart';
import 'package:cmms/feature/detail_task/repository/file_repository.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get_it/get_it.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  final BuildContext context;
  FileBloc(this.context) : super(FileInitial()) {
    on<DeleteFileEvent>((event, emit) async {
      try {
        emit(FileLoading());

        var fileRepository = await GetIt.I.getAsync<FileRepository>();
        await fileRepository.removeFile(event.idFile);
        emit(FileSucsses());
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(FileError(error: e.toString()));
      }
    });
    on<UploadFileEvent>((event, emit) async {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      FormData formData = FormData();
      if (result != null) {
        File file = File(result.files.single.path as String);
        final mimeType = lookupMimeType(result.files.single.path as String);
        String typeFile = mimeType!.split('/')[0];
        String subTypeFile = mimeType.split('/')[1];
        formData.files.add(MapEntry(
            'list_file[]',
            await MultipartFile.fromFile(file.path,
                filename: result.names[0],
                contentType: MediaType(typeFile, subTypeFile))));
        formData.fields.add(MapEntry('model', jsonEncode(event.taskModel)));
      } else {}
      try {
        emit(FileLoading());
        var fileRepository = await GetIt.I.getAsync<FileRepository>();
        // SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        if (formData.fields.isNotEmpty) {
          var resUpload = await fileRepository.uploadFile(formData);
          event.taskModel.listFileUpload = [
            ...?event.taskModel.listFileUpload,
            ...?resUpload.listFileUpload
          ];
          emit(FileSucsses());
        } else {}
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(FileError(error: e.toString()));
      }
      Navigator.pop(context);
    });
    on<DownloadFileEvent>((event, emit) async {
      try {
        emit(FileLoading());
        var respList =
            await Future.wait([getValueString(SharedPrefKey.domain)]);
        String domain = respList[0].toString();
        // SmartDialog.showLoading(msg: LocaleKeys.loading.tr());
        var localPath = (await _findLocalPath())!;
        final savedDir = Directory(localPath);
        bool hasExisted = await savedDir.exists();
        if (!hasExisted) {
          savedDir.create();
        }
        await FlutterDownloader.enqueue(
          url: 'https://$domain/SystemTask.ctr/download?id=${event.id}',
          savedDir: localPath,
          saveInPublicStorage: true,
          showNotification:
              true, // show download progress in status bar (for Android)
          openFileFromNotification:
              true, // click on notification to open downloaded file (for Android)
        );
        emit(FileSucsses());
      } catch (e) {
        SmartDialog.dismiss();
        SmartDialog.showToast('Error');
        emit(FileError(error: e.toString()));
      }
    });
  }
  List<FileUploadModel> listFileUpload = [];
  Future<String?> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationSupportDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }
}
