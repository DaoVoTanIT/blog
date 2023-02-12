import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/bottom_custom.dart';
import 'package:cmms/common/widget/button/icon_button_cpn.dart';
import 'package:cmms/common/widget/notifications.dart';
import 'package:cmms/common/widget/section_card.dart';
import 'package:cmms/common/widget/text_field/search.dart';
import 'package:cmms/feature/home_dashboard/widget/to_to_list.dart';
import 'package:cmms/feature/today_task/widget/today_task_widget.dart';
import 'package:cmms/feature/today_work_order/screen/today_work_order.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();

  late AnimationController controller;
  double progress = 0.2;
  int total = 6;
  int current = 4;
  String domain = '';
  String userName = '';
  String avatarPath = '';
  List<Map<dynamic, dynamic>> sections = [
    {
      'name': 'High Priority Work Orders',
      'amount': 3,
      'index': 1
      //'img': imgFreeQuestion,
      //  "path": Routes.healthQuestion
    },
    {
      'name': 'Overdue Work Orders',
      'amount': 2, 'index': 2

      // 'path': Routes.nextConsults
    },
    {
      'name': 'Request Pending Approval',
      //  'img': imgHealthFeed,
      'amount': 5, 'index': 3

      //  "path": Routes.healthFeed
    },
    {
      'name': 'Completed in the Last 7 days',
      // 'img': imgOnlineConsults,
      'amount': 10, 'index': 4

      // "path": Routes.onlineConsults
    },
  ];
  BottomCustomController bottomController = BottomCustomController();

  @override
  void initState() {
    getDomain();
    controller = AnimationController(
      vsync: this,
      upperBound: progress,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  getDomain() async {
    var respList = await Future.wait([
      getValueString(SharedPrefKey.domain),
      getValueString(SharedPrefKey.userName),
      getValueString(SharedPrefKey.avatarPath)
    ]);
    domain = respList[0].toString();
    userName = respList[1].toString();
    avatarPath = respList[2].toString();
  }

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarCpn(
            size: Size(width, 128),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      // Container(
                      //   width: 40,
                      //   height: 40,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(20),
                      //       image: DecorationImage(
                      //           image: NetworkImage(avatarPath),
                      //           fit: BoxFit.cover)),
                      // ),
                      CachedNetworkImage(
                          imageUrl: avatarPath,
                          placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: grey100,
                                highlightColor: isabelline,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: isabelline),
                                ),
                              ),
                          imageBuilder: (context, imageProvider) => Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          errorWidget: (context, url, error) => Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: AssetImage(logoCmms),
                                      fit: BoxFit.cover)))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${LocaleKeys.hi.tr()} $userName,',
                                  style: h3(color: black, fontWeight: '700')),
                              Text(LocaleKeys.greeting.tr(),
                                  style: h5(color: black))
                            ]),
                      ),
                    ]),
                    Notifications(
                        function: () {
                          Navigator.of(context).pushNamed(Routes.notification);
                        },
                        notifications: 3,
                        iconPath: icNotification,
                        iconColor: neonFuchsia,
                        bgColor: grey100)
                  ]),
            )),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: color4.withOpacity(0.04),
                                  offset: const Offset(0, 5),
                                  blurRadius: 10)
                            ],
                            color: grey100,
                            borderRadius: BorderRadius.circular(8)),
                        child: SearchCpn(
                          fillColor: backgroundWhite,
                          controller: searchCtl,
                          focusNode: searchFn,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    BottomCustom(
                      childInside: Container(
                        height: MediaQuery.of(context).size.height / 1.4,
                      ),
                      childShowBottom: const IconButtonCpn(
                        path: icFilter,
                        iconColor: grayBlue,
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodayWorkOrder(
                                title: 'WOs',
                                title2: 'for today',
                              )),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: TodayWorkOrderWidget(
                      total: 10,
                      current: 7,
                      title: 'WOs',
                      title2: 'for today',
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'WOs ',
                    style: h1(context: context, fontWeight: '700'),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'status',
                        style: h1(context: context),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 18),
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                      itemCount: sections.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return SectionCard(
                          item: sections[index],
                        );
                      }),
                ),
                Text(
                  'To-do list',
                  style: h2(context: context, color: black, fontWeight: '700'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        Routes.detailWorkOrder,
                      );
                    },
                    child: ToDoList(
                      device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                      code: '#WO1122/2022',
                      level: 'High',
                      requestedBy: 'Requested by Thanh Le',
                      time: DateTime.now(),
                      status: 'In Progress',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
