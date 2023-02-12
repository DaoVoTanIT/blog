import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/kpi/kpi_model.dart';
import 'package:cmms/feature/report/bloc/kpi/bloc/kpi.dart';
import 'package:cmms/translations/export_lang.dart';

class KpiReport extends StatefulWidget {
  const KpiReport({Key? key}) : super(key: key);

  @override
  State<KpiReport> createState() => _KpiReportState();
}

class _KpiReportState extends State<KpiReport> {
  late KpiBloc kpiBloc;
  @override
  void initState() {
    kpiBloc = BlocProvider.of<KpiBloc>(context);
    kpiBloc.add(GetKPIEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: kpiBloc,
      child: BlocBuilder<KpiBloc, KpiState>(
        builder: (context, state) {
          if (state is KpiSuccess) {
            return kpiInformation(state.kpiModel);
          } else if (state is KpiLoading) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget kpiInformation(KpiModel model) {
    return Scaffold(
        body: Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        padding: const EdgeInsets.only(top: 15, bottom: 7),
        decoration: const BoxDecoration(
          color: backgroundWhite,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                child: Text(LocaleKeys.kPIReport.tr(),
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
                Text(LocaleKeys.totalWorkDone.tr(),
                    style: h5(context: context, fontWeight: '700')),
                const SizedBox(
                  height: 16,
                ),
                Text('${model.taskNumber.toString()} ${LocaleKeys.works.tr()}',
                    style: h5(context: context, fontWeight: '400')),
                const SizedBox(
                  height: 24,
                ),
                Text(LocaleKeys.totalWorkingHours.tr(),
                    style: h5(context: context, fontWeight: '700')),
                const SizedBox(
                  height: 16,
                ),
                Text(
                    '${model.allWorkingTime?.toStringAsFixed(1)} ${LocaleKeys.hours.tr()}',
                    style: h5(context: context, fontWeight: '400')),
                const SizedBox(
                  height: 24,
                ),
                Text(LocaleKeys.totalWorkingDays.tr(),
                    style: h5(context: context, fontWeight: '700')),
                const SizedBox(
                  height: 16,
                ),
                Text('${model.realWorkingDate ?? ''} ${LocaleKeys.days.tr()}',
                    style: h5(context: context, fontWeight: '400')),
                const SizedBox(
                  height: 24,
                ),
                Text(LocaleKeys.workingDayStandard.tr(),
                    style: h5(context: context, fontWeight: '700')),
                const SizedBox(
                  height: 16,
                ),
                Text(
                    '${model.allWorkingDate.toString()} ${LocaleKeys.days.tr()}',
                    style: h5(context: context, fontWeight: '400')),
                const SizedBox(
                  height: 24,
                ),
                Text(LocaleKeys.rate.tr(),
                    style: h5(context: context, fontWeight: '700')),
                const SizedBox(
                  height: 16,
                ),
                Text('${model.starNumber.toString()} ${LocaleKeys.stars.tr()}',
                    style: h5(context: context, fontWeight: '400')),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ]),
      )
    ]));
  }
}
