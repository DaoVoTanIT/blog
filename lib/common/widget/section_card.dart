import 'package:cmms/feature/today_work_order/screen/today_work_order.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/translations/export_lang.dart';

class SectionCard extends StatelessWidget {
  const SectionCard({Key? key, required this.item}) : super(key: key);
  final Map<dynamic, dynamic> item;

  @override
  Widget build(BuildContext context) {
    final news = item['new'] != null && item['new'] > 150
        ? '150+'
        : item['new'].toString();
    return GestureDetector(
      onTap: () {
        if (item['name'] == LocaleKeys.workProfileManagement.tr()) {
          // Navigator.of(context).pushNamed(item['path'],
          //     arguments: const ProfileManagement(doctorModel: user));
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TodayWorkOrder(
                      title: '',
                      title2: item['name'],
                    )),
          );
          // Navigator.of(context).pushNamed(item['path']);
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: grey100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 16,
              offset: Offset(0, 2),
              color: Color.fromRGBO(167, 115, 102, 0.16),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: item['img'] != null
                  ? ImageAsset(item['img'] ?? imgLogo, width: 56, height: 56)
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        ImageAsset(
                          nextConsultForYou,
                          width: 56,
                          height: 56,
                          color: item['index'] == 1
                              ? orange
                              : item['index'] == 2
                                  ? redLight
                                  : item['index'] == 3
                                      ? blue
                                      : tiffanyBlue,
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Text(
                            item['amount'].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 56,
                              fontFamily: 'Oswald',
                              height: 56 / 48,
                              color: item['index'] == 1
                                  ? orange
                                  : item['index'] == 2
                                      ? redLight
                                      : item['index'] == 3
                                          ? blue
                                          : tiffanyBlue,
                            ),
                          ),
                        )
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(item['name'] ?? 'invalid',
                  textAlign: TextAlign.center, style: h6(context: context)),
            ),
            item['new'] != null
                ? Text('$news ${LocaleKeys.news.tr()}',
                    style: h6(color: grayBlue))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
