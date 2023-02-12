import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/feature/detail_work_order/widget/work_order_complete.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class CheckListWorkOrderAssets extends StatefulWidget {
  const CheckListWorkOrderAssets({Key? key}) : super(key: key);
  @override
  State<CheckListWorkOrderAssets> createState() =>
      _CheckListWorkOrderAssetsState();
}

class _CheckListWorkOrderAssetsState extends State<CheckListWorkOrderAssets> {
  bool darkMode = false;
  DateFormat formatHour = DateFormat(formatDateTimeString);
  String domain = '';
  bool isCheck = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    getDomain();
    super.initState();
  }

  getDomain() async {
    var respList = await Future.wait([getValueString(SharedPrefKey.domain)]);
    domain = respList[0].toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 5,
            bottom: MediaQuery.of(context).padding.bottom),
        child: ElevatedCpn(
          boxShadow: [
            BoxShadow(
                color: orange.withOpacity(0.4),
                offset: const Offset(0, 10),
                blurRadius: 20)
          ],
          function: () {},
          bgColor: orange,
          textButton: LocaleKeys.start.tr(),
          leftWidget: const Icon(Icons.schedule_outlined),
          textStyle: h5(color: grey100, fontWeight: '700'),
        ),
      ),
      appBar: AppBarCpn(
          bottom: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: Text(
                    'Máy cắt thuỷ lực 150 tấn - Checklist Kiểm tra đầu giờ 01',
                    style: h1(context: context, fontWeight: '700'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '4 of 6 completed',
                  style: h5(context: context, color: grey700),
                ),
              ],
            ),
            const Spacer(),
            const WorkOrderCompleteWidget(
              width: 120,
              height: 120,
              lineWidth: 8,
              current: 4,
              title: 'Tiến độ',
              total: 13,
            ),
          ],
        ),
      )),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 16),
                width: double.infinity,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: color4.withOpacity(0.04),
                      offset: const Offset(0, 5),
                      blurRadius: 10)
                ], color: grey100, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            isCheck = true;
                          } else {
                            isCheck = false;
                          }
                        });
                      },
                      activeColor: goGreen,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Talk to a doctor in Dentistry',
                            style: TextStyle(
                                decoration: isCheck
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                fontSize: 16,
                                height: 24 / 20,
                                fontFamily: 'Mulish',
                                color: isCheck ? grayBlue : grey1000),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Caring for Your Toodler',
                            style: h5(context: context, color: grey700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
