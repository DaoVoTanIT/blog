import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/notification/NotificationModel.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/feature/notification/notification_bloc/notification/bloc/notification.dart';
import 'package:cmms/translations/export_lang.dart';

class DetailNotificationPage extends StatefulWidget {
  DetailNotificationPage({Key? key, required this.noti}) : super(key: key);
  NotificationModel noti;

  @override
  State<DetailNotificationPage> createState() => _DetailNotificationPageState();
}

class _DetailNotificationPageState extends State<DetailNotificationPage> {
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
      appBar: AppBarCpn(
        center: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text(
            LocaleKeys.noticeDetail.tr(),
            style: h1(color: black, fontWeight: '700'),
          ),
        ),
        color: backgroundWhite,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                widget.noti.desc,
                style: h5(
                  context: context,
                  fontWeight: '600',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
