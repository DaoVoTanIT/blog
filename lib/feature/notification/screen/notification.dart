import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmms/common/widget/button/icon_button_cpn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/feature/notification/notification_bloc/notification/bloc/notification.dart';
import 'package:cmms/feature/notification/widget/notification_widget.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:cmms/common/model/notification/NotificationModel.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool darkMode = false;

  late NotificationBloc notificationBloc;

  final FirebaseFirestore instance = FirebaseFirestore.instance;
  var endPage = false;
  var isloadmore = false;
  dynamic lastVisible;
  @override
  void dispose() {
    super.dispose();
  }

  List<NotificationModel> notificationList = [
    NotificationModel(
      id: '1',
      title:
          'You have appointment with Dr. Ethel Howard at 08:00 PM today. Please prepare health record...',
      desc:
          'You have appointment with Dr. Ethel Howard at 08:00 PM today. Please prepare health record...',
      send_time_index: 1670320427200,
      user_id_create: '1',
      user_id_receive: '1aaaafsfaafsv',
      image: imgHealthFeed,
      status: 1,
      domain: '',
    ),
    NotificationModel(
      id: '1',
      title:
          'Completed your profile to be better health consults. Complete profile >',
      desc: '',
      send_time_index: 1670474627000,
      user_id_create: '1',
      user_id_receive: '1aaaafsfaafsv',
      image: imgLovedOne,
      status: 3,
      domain: '',
    ),
    NotificationModel(
      id: '1',
      title: 'You received the answer from Dr. Alan Walker',
      desc: '',
      send_time_index: 1670463827000,
      user_id_create: '1',
      user_id_receive: '1aaaafsfaafsv',
      image: imgConsultMange,
      status: 1,
      domain: '',
    ),
    NotificationModel(
      id: '1',
      title: 'You received the answer from Dr. Alan Walker',
      desc: '',
      send_time_index: 1670320427000,
      user_id_create: '1',
      user_id_receive: '1aaaafsfaafsv',
      image: imgKid,
      status: 1,
      domain: '',
    ),
  ];
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
    return Scaffold(
        backgroundColor: backgroundWhite,
        appBar: AppBarCpn(
          right: Row(
            children: const [
              IconButtonCpn(
                  path: icEyeOn,
                  iconColor: dodgerBlue,
                  borderColor: dodgerBlue),
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: IconButtonCpn(
                    path: icSetting,
                    iconColor: dodgerBlue,
                    borderColor: dodgerBlue),
              )
            ],
          ),
        ),
        // body: SingleChildScrollView(
        //   physics: const AlwaysScrollableScrollPhysics(),
        //   child: notificationWidget(context, notificationList, notificationBloc),
        // child: Column(
        //   children: [
        //     BlocProvider.value(
        //       value: notificationBloc,
        //       child: BlocBuilder<NotificationBloc, NotificationState>(
        //         buildWhen: (previous, current) {
        //           return current is NotificationSuccess;
        //         },
        //         builder: (context, state) {
        //           return notificationWidget(
        //               context, state.listNotificationModel, notificationBloc);
        //         },
        //       ),
        //     ),
        //   ],
        // ),
        //),
        body: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24, bottom: 40),
                child: Text(LocaleKeys.notification.tr(),
                    style: h1(context: context, fontWeight: '700')),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    var item = notificationList[index];
                    return notificationWidget(context, item, notificationBloc);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
