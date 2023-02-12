import 'package:cmms/feature/home_dashboard/screen/home.dart';
import 'package:cmms/feature/home_dashboard/widget/home_widget.dart';
import 'package:cmms/feature/work_order/screen/work_order.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/feature/account/screen/account.dart';
import 'package:cmms/feature/assets_maintenance/screen/assets_home.dart';
import 'package:cmms/feature/report/screen/home_report.dart';
import 'dart:io' show Platform;

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, this.child = const Home()})
      : super(key: key);
  final Widget child;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> listWidget = [];
  int _currentIndex = 0;
  int? notification = 0;

  @override
  void initState() {
    super.initState();

    listWidget = [
      const Home(),
      const WorkOrderPage(),
      const AssetsPage(),
      const Account(),
      const HomeReport(),
    ];
    //  context.read<CheckNotificationCubit>().getListNotification();
  }

  @override
  Widget build(BuildContext context) {
    return
        //  FloatingDraggableWidget(
        //   floatingWidget: FloatingActionButton(
        //     onPressed: () {
        //       showModalBottomSheet<void>(
        //         context: context,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(25.0),
        //         ),
        //         isScrollControlled: true,
        //         builder: (BuildContext context) {
        //           return SizedBox(
        //               height: MediaQuery.of(context).size.height / 1.5,
        //               child: const Woking());
        //         },
        //       );
        //     },
        //     backgroundColor: dodgerBlue,
        //     child: const Icon(Icons.pause_circle_filled_outlined),
        //   ),
        //   floatingWidgetHeight: 60,
        //   floatingWidgetWidth: 60,
        //   dx: 200,
        //   dy: 300,
        //   mainScreenWidget:
        Scaffold(
      //  floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      resizeToAvoidBottomInset: false,
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: Container(
          height: Platform.isIOS ? 112 : 80,
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 16,
                offset: Offset(0, 2),
                color: Color.fromRGBO(167, 115, 102, 0.16))
          ]),
          child: BottomNavigationBar(
              currentIndex: _currentIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedFontSize: 10,
              selectedFontSize: 10,
              unselectedLabelStyle: h14(
                context: context,
                color: black,
                fontWeight: '700',
              ),
              selectedLabelStyle:
                  h14(context: context, color: black, fontWeight: '700'),
              selectedItemColor: tiffanyBlue,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              items: [
                createItemNav(
                  context,
                  logoCmms,
                  'Overview',
                  false, //show notification
                ),
                createItemNav(
                  context,
                  icDocument,
                  'Work Order',
                  false,
                ),
                createItemNav(context, icTree, 'Assets', false),
                createItemNav(context, tab3, 'Account', false),
              ])
          // ),
          ),
    );
  }
}
