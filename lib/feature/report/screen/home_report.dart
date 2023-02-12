import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:cmms/common/widget/app_bar_home.dart';
import 'package:cmms/common/widget/tab_bar.dart';
import 'package:cmms/feature/report/screen/complete_task_report.dart';
import 'package:cmms/feature/report/screen/kip_report.dart';
import 'package:cmms/translations/export_lang.dart';

class HomeReport extends StatefulWidget {
  const HomeReport({Key? key}) : super(key: key);

  @override
  State<HomeReport> createState() => _HomeReportState();
}

class _HomeReportState extends State<HomeReport> with TickerProviderStateMixin {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();

  double progress = 0.2;
  int total = 6;
  int current = 4;
  @override
  void initState() {
    checkIsSignIn();
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   bottomController.show(
    //       context, backgroundColor, IncomingCall(doctorModel: doctorsDemo[0]));
    // });
  }

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  checkIsSignIn() async {
    var respList = await Future.wait([getValueString(SharedPrefKey.tokenUser)]);
    String token = respList[0].toString();
    // if (mounted && token == 'null') {
    //   Navigator.pushNamedAndRemoveUntil(
    //       context, Routes.login, (Route<dynamic> route) => false);
    // }
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBarHome(
            color: backgroundWhite,
            bottom: TabbarCpn(
              color: backgroundWhite,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelStyle: h5(context: context, fontWeight: '700'),
                    unselectedLabelStyle:
                        h5(context: context, fontWeight: '600'),
                    labelColor: black,
                    unselectedLabelColor: grayBlue,
                    indicatorColor: black,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0, color: black),
                        insets: EdgeInsets.only(top: 20, bottom: 5, right: 20)),
                    tabs: [
                      Tab(text: LocaleKeys.kpi.tr()),
                      Tab(text: LocaleKeys.workDone.tr()),
                      Tab(text: LocaleKeys.location.tr()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              KpiReport(),
              CompleteTask(),
              Center(child: Text('Tính năng đang phát triển'))
            ],
          )),
    );
  }
}
