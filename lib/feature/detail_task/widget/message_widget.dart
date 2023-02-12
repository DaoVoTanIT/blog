import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/model/message/message_model.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/translations/export_lang.dart';

buildMessage(BuildContext context, List<MessageModel> listMessageModel) {
  DateFormat formatDateHour = DateFormat(formatDateHourString);
  // listMessageModel.sort(
  //   (a, b) => b.db.dateSend.compareTo(a.db.dateSend),
  // );
  return Column(
    children: [
      ...listMessageModel.map(
        (e) => Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: grey200),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(e.createName ?? '',
                            style: h11(context: context, fontWeight: '700'))),
                    Expanded(
                        child: Text(formatDateHour.format(e.db!.dateSend!),
                            style: h8(
                                context: context,
                                fontWeight: '400',
                                color: grey700))),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Html(
                      data: e.db?.msg == null
                          ? ''
                          : '<span>${e.db?.msg}</span>' '',
                      style: {
                        'span': Style(
                            color: grey1000,
                            fontSize: const FontSize(14),
                            lineHeight: const LineHeight(1.5),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Mulish')
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}
