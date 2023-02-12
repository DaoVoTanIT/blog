import 'package:filesize/filesize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/model/checklist/check_list.dart';
import 'package:cmms/common/model/message/message_model.dart';
import 'package:cmms/common/model/task/task_model.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/bottom_custom.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/checklist/bloc/checklist.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/file/bloc/file.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/message/bloc/message.dart';
import 'package:cmms/feature/detail_task/widget/add_message_widget.dart';
import 'package:cmms/feature/detail_task/widget/checklist_widget.dart';
import 'package:cmms/feature/detail_task/widget/message_widget.dart';
import 'package:cmms/feature/detail_task/widget/task_complete_widget.dart';
import 'package:cmms/translations/export_lang.dart';

class DetailTask extends StatefulWidget {
  DetailTask({Key? key, required this.context, required this.taskModel})
      : super(key: key);
  BuildContext context;
  TaskModel taskModel;
  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  late TaskModel taskModel;
  DateFormat formatDate = DateFormat(formatDateString);
  DateFormat formatHour = DateFormat(formatHourMinuteString);
  DateFormat formatDateHour = DateFormat(formatDateHourString);
  String userName = '';
  late ChecklistBloc checklistBloc;
  late MessageBloc messageBloc;
  late FileBloc fileBloc;
  List<CheckListModel> checkListComplete = [];
  double totalCheckListComplete = 0;
  double totalCheck = 1;
  @override
  void initState() {
    fileBloc = BlocProvider.of<FileBloc>(context);
    checklistBloc = BlocProvider.of<ChecklistBloc>(context);
    messageBloc = BlocProvider.of<MessageBloc>(context);
    taskModel = widget.taskModel;
    fileBloc = FileBloc(widget.context);
    checklistBloc.add(GetChecklistEvent(id: taskModel.db.id.toString()));
    messageBloc.add(GetListMessageEvent(id: taskModel.db.id.toString()));
    getUser();
    super.initState();
  }

  getUser() async {
    var respList = await Future.wait([getValueString(SharedPrefKey.userName)]);
    userName = respList[0].toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String getText(int status) {
    return status == 1
        ? LocaleKeys.unfulfilled.tr()
        : status == 2
            ? LocaleKeys.processing.tr()
            : status == 3
                ? LocaleKeys.pause.tr()
                : status == 4
                    ? LocaleKeys.complete.tr()
                    : LocaleKeys.undefined.tr();
  }

  Color getColor(int status) {
    return status == 1 // chua thuc hien
        ? CupertinoColors.systemRed
        : status == 2 // dang thuc hien
            ? CupertinoColors.activeBlue
            : status == 3 // tam hoan
                ? CupertinoColors.systemYellow
                : status == 4
                    ? CupertinoColors.activeGreen // hoan thanh
                    : CupertinoColors.activeBlue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCpn(
        color: backgroundWhite,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
              decoration: const BoxDecoration(color: backgroundWhite),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lập hồ sơ dự án',
                      style: h1(context: context, fontWeight: '700'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tham gia',
                              style: h7(context: context, color: grey600),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 16),
                                //   child: ClipRRect(
                                //     borderRadius: BorderRadius.circular(24),
                                //     child: const ImageAsset(
                                //       avt1,
                                //       width: 24,
                                //       height: 24,
                                //     ),
                                //   ),
                                // ),
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 16),
                                //   child: ClipRRect(
                                //     borderRadius: BorderRadius.circular(24),
                                //     child: const ImageAsset(
                                //       avt2,
                                //       width: 24,
                                //       height: 24,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thời gian',
                              style: h7(context: context, color: grey600),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              taskModel.db.startTime == null ||
                                      taskModel.db.endTime == null
                                  ? LocaleKeys.undefined.tr()
                                  : '${formatHour.format(taskModel.db.startTime!)}-${formatDate.format(taskModel.db.endTime!)}',
                              style: h5(context: context),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      'Trạng thái',
                      style: h7(context: context, color: grey600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 33),
                      child: Row(
                        children: [
                          Container(
                            height: 12,
                            width: 12,
                            decoration: BoxDecoration(
                              color: getColor(taskModel.db.status!),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(1.0)),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(getText(taskModel.db.status!),
                              style: h5(
                                fontFamily: '600',
                                context: context,
                              ))
                        ],
                      ),
                    ),
                  ]),
            ),
            Container(
                margin: const EdgeInsets.only(
                  bottom: 12,
                ),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 15, top: 20),
                decoration: const BoxDecoration(color: backgroundWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.subject,
                          color: grey500,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text('Nội dung',
                            style: h11(context: context, fontWeight: '700')),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 37, top: 13),
                      child: Text(taskModel.milestoneName.toString(),
                          style: h12(context: context, fontWeight: '400')),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(
                  bottom: 12,
                ),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 15, top: 20),
                decoration: const BoxDecoration(color: backgroundWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_file,
                          color: grey500,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text('Tài liệu đính kèm',
                            style: h11(context: context, fontWeight: '700')),
                        const Spacer(),
                        BottomCustom(
                          backgroundColor: grey100,
                          childShowBottom: GestureDetector(
                            onTap: (() => fileBloc
                                .add(UploadFileEvent(taskModel: taskModel))),
                            child: const Icon(
                              Icons.add,
                              color: grey500,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocProvider.value(
                        value: fileBloc,
                        child: BlocBuilder<FileBloc, FileState>(
                            buildWhen: (previous, current) {
                              return current is FileSucsses;
                            },
                            builder: ((context, state) => taskModel
                                    .listFileUpload!.isEmpty
                                ? Container()
                                : Column(
                                    children: [
                                      ...taskModel.listFileUpload!.map((e) =>
                                          Container(
                                            decoration: BoxDecoration(
                                              color: e.db!.fileType ==
                                                      'image/jpeg'
                                                  ? greenDeep.withOpacity(0.15)
                                                  : dodgerBlue
                                                      .withOpacity(0.15),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            margin: const EdgeInsets.only(
                                              top: 20,
                                            ),
                                            padding: const EdgeInsets.all(16),
                                            child: Row(
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      color: e.db!.fileType ==
                                                              'image/jpeg'
                                                          ? greenDeep
                                                              .withOpacity(0.1)
                                                          : blueDocument
                                                              .withOpacity(0.1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 14),
                                                    child: e.db!.fileType ==
                                                            'image/jpeg'
                                                        ? const Icon(
                                                            Icons
                                                                .image_outlined,
                                                            color: greenDeep,
                                                            size: 40,
                                                          )
                                                        : const Icon(
                                                            Icons
                                                                .description_outlined,
                                                            color: blueDocument,
                                                            size: 40,
                                                          )),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      child: Text(
                                                          e.db!.fileName
                                                              .toString(),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: h5(
                                                              context: context,
                                                              fontWeight:
                                                                  '700')),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Text(
                                                        filesize(
                                                            e.db!.fileSize),
                                                        style: h7(
                                                            color: grey500,
                                                            context: context,
                                                            fontWeight: '400')),
                                                  ],
                                                ),
                                                const Spacer(),
                                                BottomCustom(
                                                  backgroundColor: grey100,
                                                  childInside: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
                                                    margin:
                                                        const EdgeInsets.all(
                                                            10),
                                                    height: 150,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color:
                                                                  neonFuchsia,
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                fileBloc.add(
                                                                    DeleteFileEvent(
                                                                        idFile: e
                                                                            .db!
                                                                            .id
                                                                            .toString()));
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                taskModel
                                                                    .listFileUpload!
                                                                    .remove(e);
                                                              },
                                                              child: Text(
                                                                  LocaleKeys
                                                                      .delete
                                                                      .tr(),
                                                                  style: h5(
                                                                      color:
                                                                          neonFuchsia,
                                                                      context:
                                                                          context,
                                                                      fontWeight:
                                                                          '700')),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  childShowBottom: const Icon(
                                                    Icons.more_horiz,
                                                    color: grey500,
                                                    size: 30,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  )))),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(
                  bottom: 12,
                ),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 15, top: 20),
                decoration: const BoxDecoration(color: backgroundWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.task_alt_outlined,
                          color: grey500,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text('Checklist ',
                            style: h11(context: context, fontWeight: '700')),
                        const Spacer(),
                        BottomCustom(
                          backgroundColor: grey100,
                          childInside: AddWidget(
                            idTask: taskModel.db.id.toString(),
                            func: (content) {
                              var checkList = CheckListModel(createName: '')
                                ..db = Db(
                                    statusFinish: true,
                                    idTask: taskModel.db.id,
                                    checklist: content,
                                    createDate: DateTime.now(),
                                    statusDel: 0,
                                    stt: 0);

                              checklistBloc
                                  .add(CreateCheckListEvent(model: checkList));
                            },
                            title: LocaleKeys.addWork.tr(),
                            hintText: LocaleKeys.planning.tr(),
                            lableText: LocaleKeys.work.tr(),
                            typeAdd:
                                0, // 0 la add check list, 1 la add widget tin nhan
                          ),
                          childShowBottom: GestureDetector(
                            child: const Icon(
                              Icons.add,
                              color: grey500,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocProvider.value(
                      value: checklistBloc,
                      child: BlocConsumer<ChecklistBloc, ChecklistState>(
                          buildWhen: (previous, current) {
                            return current is ChecklistSuccess;
                          },
                          listener: (context, state) {},
                          builder: (BuildContext context, state) {
                            checkListComplete = state.listCheckListModel
                                .where((element) =>
                                    element.db?.statusFinish == true)
                                .toList();
                            totalCheckListComplete =
                                checkListComplete.length.toDouble();
                            totalCheck =
                                state.listCheckListModel.length.toDouble();
                            return Column(
                              children: [
                                TaskCompleteLevelWidget(
                                  current: totalCheckListComplete,
                                  title: 'Tiến độ',
                                  total: totalCheck,
                                ),
                                buildInforChecklist(context,
                                    state.listCheckListModel, checklistBloc)
                              ],
                            );
                          }),
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(
                  bottom: 12,
                ),
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 10, top: 20),
                decoration: const BoxDecoration(color: backgroundWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.message,
                          color: grey500,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Text(LocaleKeys.message.tr(),
                            style: h5(context: context, fontWeight: '700')),
                        const Spacer(),
                        BottomCustom(
                          backgroundColor: grey100,
                          childInside: AddWidget(
                            idTask: taskModel.db.id.toString(),
                            func: (content) {
                              var createMessage = MessageModel()
                                ..db = MessageDb(
                                    idTask: taskModel.db.id,
                                    userSend: userName,
                                    dateSend: DateTime.now(),
                                    msg: content,
                                    statusDel: 0,
                                    type: 0);

                              messageBloc.add(
                                  CreateMessageEvent(model: createMessage));
                            },
                            title: LocaleKeys.message.tr(),
                            hintText: LocaleKeys.planning.tr(),
                            lableText: LocaleKeys.content.tr(),
                            typeAdd: 1,
                          ),
                          childShowBottom: const Icon(
                            Icons.add,
                            color: grey500,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    BlocProvider.value(
                      value: messageBloc,
                      child: BlocBuilder<MessageBloc, MessageState>(
                          bloc: messageBloc,
                          buildWhen: (context, state) {
                            return state is MessageSuccess;
                          },
                          builder: (BuildContext context, state) {
                            return buildMessage(
                                context, state.listMessageModel);
                          }),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
