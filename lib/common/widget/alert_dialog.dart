import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/translations/export_lang.dart';

Future<void> alearDialog(BuildContext context, String content,
    final Function()? function, bool? showButtonClose) {
  return showDialog(
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
            content,
            // '${LocaleKeys.markUnread.tr()}?',
            textAlign: TextAlign.center,
            style: h4(context: context, fontWeight: '700'),
          ),
          actions: <Widget>[
            showButtonClose == true
                ? Container()
                : Row(
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
                            // notificationBloc.add(ReadNotificationEvent(
                            //     1, noti.id.toString()));
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
