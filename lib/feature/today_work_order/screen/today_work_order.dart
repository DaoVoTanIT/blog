import 'dart:async';

import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/feature/home_dashboard/widget/to_to_list.dart';
import 'package:cmms/feature/today_task/widget/today_task_widget.dart';
import 'package:flutter/material.dart';

class TodayWorkOrder extends StatefulWidget {
  const TodayWorkOrder({Key? key, this.title, this.title2}) : super(key: key);
  final String? title;
  final String? title2;

  @override
  State<TodayWorkOrder> createState() => _TodayWorkOrderState();
}

class _TodayWorkOrderState extends State<TodayWorkOrder> {
  List<Map<String, dynamic>> tasks = [];
  bool show = false;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (time) {
      setState(() {
        show = true;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCpn(),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: TodayWorkOrderWidget(
                  total: 10,
                  current: 7,
                  title: widget.title.toString(),
                  title2: widget.title2.toString(),
                ),
              ),
              AnimationClick(
                function: () {
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
              )
              // ListView.separated(
              //   separatorBuilder: (context, index) {
              //     return const SizedBox(height: 16);
              //   },
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemCount: tasks.length,
              //   itemBuilder: (context, index) {
              //     return show == false ? const ShimmerCpn() : item(tasks[index]);
              //   },
              // ),
            ],
          ),
        ));
  }
}
