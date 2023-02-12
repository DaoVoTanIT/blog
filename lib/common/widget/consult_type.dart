import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/translations/export_lang.dart';

import 'image.dart';

class ConsultType extends StatefulWidget {
  const ConsultType({Key? key}) : super(key: key);

  @override
  State<ConsultType> createState() => _ConsultTypeState();
}

class _ConsultTypeState extends State<ConsultType> {
  List<Map<String, dynamic>> consultType = [
    {
      'icon': icTypeMessage,
      'title': LocaleKeys.message.tr(),
      'selected': false
    },
    {
      'icon': icTypeLiveChat,
      'title': LocaleKeys.liveChat.tr(),
      'selected': false
    },
    {'icon': icTypeCall, 'title': LocaleKeys.voice.tr(), 'selected': false},
    {'icon': icTypeVideo, 'title': LocaleKeys.video.tr(), 'selected': false}
  ];
  @override
  Widget build(BuildContext context) {
    bool selectedAll = consultType.every((e) => e['selected']);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            LocaleKeys.consultType.tr(),
            style: h3(fontWeight: '700', context: context),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                  ),
                ),
                Text(
                  LocaleKeys.allType.tr(),
                  style: h4(fontWeight: '600', context: context),
                ),
              ],
            ),
            Checkbox(
                value: selectedAll,
                activeColor: dodgerBlue,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: dodgerBlue),
                    borderRadius: BorderRadius.circular(24)),
                onChanged: (value) {
                  setState(() => {
                        for (Map<String, dynamic> element in consultType)
                          {element['selected'] = value}
                      });
                })
          ],
        ),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ImageAsset(consultType[index]['icon']),
                      ),
                      Text(
                        consultType[index]['title'],
                        style: h4(context: context),
                      ),
                    ],
                  ),
                  Checkbox(
                      value: consultType[index]['selected'],
                      activeColor: dodgerBlue,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: dodgerBlue),
                          borderRadius: BorderRadius.circular(4)),
                      onChanged: (value) {
                        setState(() {
                          consultType[index]['selected'] =
                              !consultType[index]['selected'];
                        });
                      })
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 24,
              );
            },
            itemCount: consultType.length),
      ],
    );
  }
}
