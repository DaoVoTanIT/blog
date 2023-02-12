import 'package:cmms/common/widget/image.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/notification/NotificationModel.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/feature/notification/notification_bloc/notification/bloc/notification.dart';
import 'package:cmms/feature/notification/screen/detail_notification.dart';
import 'package:cmms/translations/export_lang.dart';

notificationWidget(BuildContext context, NotificationModel noti,
    NotificationBloc notificationBloc) {
  DateFormat formatDate = DateFormat(formatDateHourString);

  return GestureDetector(
      onTap: () {
        if (noti.status == 1) {
          notificationBloc.add(ReadNotificationEvent(2, noti.id.toString()));
        }
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailNotificationPage(
              noti: noti,
            ),
          ),
        );
      },
      onLongPress: () {
        if (noti.status == 2) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Image.asset(
                    imgWarning,
                    height: 40,
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  content: Text(
                    '${LocaleKeys.markUnread.tr()}?',
                    textAlign: TextAlign.center,
                    style: h4(context: context, fontWeight: '700'),
                  ),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: grey300),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: TextButton(
                            child: Text(
                              LocaleKeys.yes.tr(),
                              style: h5(
                                  context: context,
                                  fontWeight: '600',
                                  color: redLight),
                            ),
                            onPressed: () {
                              notificationBloc.add(
                                  ReadNotificationEvent(1, noti.id.toString()));
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                            color: tiffanyBlue,
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: TextButton(
                            child: Text(
                              LocaleKeys.no.tr(),
                              style: h5(
                                  context: context,
                                  fontWeight: '600',
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                );
              });
        }
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          // padding:
          //     const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          // decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(24),
          //     color: grey100,
          //     boxShadow: [
          //       BoxShadow(
          //           color: color4.withOpacity(0.04),
          //           offset: const Offset(0, 5),
          //           blurRadius: 10)
          //     ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: noti.status == 1 ? neonFuchsia : null,
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: tiffanyBlue.withOpacity(0.2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: ImageAsset(
                          noti.image,
                        ),
                      ))
                ],
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   LocaleKeys.notification.tr(),
                      //   style: h5(context: context, fontWeight: '700'),
                      // ),
                      // const SizedBox(
                      //   height: 4,
                      // ),
                      Text(noti.title.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: h5(
                              context: context,
                              fontWeight: '400',
                              color: black)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                          (formatDate.format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  noti.send_time_index))),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: h5(
                              context: context,
                              fontWeight: '600',
                              color: black)),
                    ],
                  ),
                ),
              ),
            ],
          )));
}
