import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/button/icon_button_cpn.dart';
import 'package:cmms/common/widget/text_field/search.dart';
import 'package:cmms/feature/home_dashboard/widget/to_to_list.dart';
import 'package:cmms/feature/work_order/screen/calendar_work_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/bottom_custom.dart';
import 'package:cmms/feature/notification/notification_bloc/notification/bloc/notification.dart';

class WorkOrderPage extends StatefulWidget {
  const WorkOrderPage({Key? key}) : super(key: key);

  @override
  State<WorkOrderPage> createState() => _WorkOrderPageState();
}

class _WorkOrderPageState extends State<WorkOrderPage>
    with TickerProviderStateMixin {
  bool darkMode = false;
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  late NotificationBloc notificationBloc;
  final FirebaseFirestore instance = FirebaseFirestore.instance;
  late TabController tabCtl = TabController(length: 2, vsync: this);

  @override
  void dispose() {
    searchCtl.dispose();
    tabCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    notificationBloc = BlocProvider.of<NotificationBloc>(context);
    notificationBloc.add(GetNotificationEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarCpn(
            left: Text(
              'Work order',
              style: h1(context: context, fontWeight: '700'),
            ),
            right: GestureDetector(
              onTap: () {
                //Navigator.pushNamed(context, Routes.calendarWorkOrderPage);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CalendarWorkOrderPage()),
                );
              },
              child: IconButtonCpn(
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CalendarWorkOrderPage()),
                  );
                },
                path: icCalendar,
                iconColor: dodgerBlue,
                borderColor: dodgerBlue,
              ),
            ),
            bottom: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchCpn(
                          controller: searchCtl,
                          focusNode: searchFn,
                          hintText: 'Search',
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
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelStyle: h4(context: context, fontWeight: '700'),
                    unselectedLabelStyle:
                        h4(context: context, fontWeight: '600'),
                    labelColor: tiffanyBlue,
                    unselectedLabelColor: grayBlue,
                    indicatorColor: tiffanyBlue,
                    indicatorWeight: 0,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    controller: tabCtl,
                    indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0, color: tiffanyBlue),
                        insets: EdgeInsets.only(top: 20, bottom: 5, right: 25)),
                    tabs: [
                      const Tab(text: 'Assigned to me'),
                      const Tab(text: 'Assigned by me'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabCtl,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      Routes.detailWorkOrder,
                    );
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      Routes.detailWorkOrder,
                    );
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                        ToDoList(
                          device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                          code: '#WO1122/2022',
                          level: 'High',
                          requestedBy: 'Requested by Thanh Le',
                          time: DateTime.now(),
                          status: 'In Progress',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
