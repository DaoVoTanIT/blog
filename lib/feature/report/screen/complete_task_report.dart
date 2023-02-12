import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/task/task_model.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/feature/report/bloc/complete_report/bloc/complete_task.dart';
import 'package:cmms/translations/export_lang.dart';

class CompleteTask extends StatefulWidget {
  const CompleteTask({Key? key}) : super(key: key);

  @override
  State<CompleteTask> createState() => _CompleteTaskState();
}

class _CompleteTaskState extends State<CompleteTask> {
  late CompleteTaskBloc completeTaskBloc;
  DateFormat formatDateHour = DateFormat(formatDateHourString);

  @override
  void initState() {
    completeTaskBloc = BlocProvider.of<CompleteTaskBloc>(context);
    completeTaskBloc.add(GetCompleteTaskEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: completeTaskBloc,
      child: BlocBuilder<CompleteTaskBloc, CompleteTaskState>(
        builder: (context, state) {
          if (state is CompleteTaskSuccess) {
            return complteteTaskInformation(state.listReportCompleteModel);
          } else if (state is CompleteTaskLoading) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget complteteTaskInformation(List<TaskModel> model) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        ...model.map((e) => Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 20),
              padding: const EdgeInsets.only(top: 15, bottom: 7),
              decoration: const BoxDecoration(
                color: backgroundWhite,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 30,
                            // top: 25,
                          ),
                          alignment: Alignment.center,
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: tiffanyBlue.withOpacity(0.16),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.assignment_turned_in_outlined,
                            color: tiffanyBlue,
                            size: 20,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            //  top: 25,
                          ),
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(e.contractName ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: h5(context: context, fontWeight: '700')),
                        ),
                      ],
                    ),
                    AppWidget.divider2(),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 30,
                        // top: 25,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' ${LocaleKeys.milestones.tr()}',
                              style: h5(context: context, fontWeight: '400')),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                              '${e.milestoneName.toString()} ${LocaleKeys.works.tr()}',
                              style: h5(context: context, fontWeight: '700')),
                          const SizedBox(
                            height: 19,
                          ),
                          Text(LocaleKeys.workContent.tr(),
                              style: h5(context: context, fontWeight: '400')),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(e.db.name.toString(),
                              style: h5(context: context, fontWeight: '700')),
                          const SizedBox(
                            height: 19,
                          ),
                          Text(LocaleKeys.time.tr(),
                              style: h5(context: context, fontWeight: '400')),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                              e.db.startTime == null
                                  ? LocaleKeys.undefined.tr()
                                  : formatDateHour.format(e.db.startTime!),
                              style: h5(context: context, fontWeight: '700')),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              e.db.endTime == null
                                  ? LocaleKeys.undefined.tr()
                                  : formatDateHour.format(e.db.endTime!),
                              style: h5(context: context, fontWeight: '700')),
                          const SizedBox(
                            height: 19,
                          ),
                          Text(LocaleKeys.participants.tr(),
                              style: h5(context: context, fontWeight: '400')),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                              '${e.participateInNames?.length ?? ""} ${LocaleKeys.people.tr()}',
                              style: h5(context: context, fontWeight: '700')),
                          const SizedBox(
                            height: 19,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ))
      ]),
    ));
  }
}
