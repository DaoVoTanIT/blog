import 'dart:async';

import 'package:cmms/app/animation_click.dart';
import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/util/config.dart';
import 'package:cmms/common/widget/bottom_custom.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/button/icon_button_cpn.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/common/widget/section_box.dart';
import 'package:cmms/feature/detail_work_order/detail_work_order_bloc/timer/bloc/timer.dart';
import 'package:cmms/feature/detail_work_order/widget/work_order_complete.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/shared_pref_key.dart';
import 'package:cmms/common/preference/shared_pref_builder.dart';

class DetailWorkOrderAssets extends StatefulWidget {
  const DetailWorkOrderAssets({Key? key}) : super(key: key);

  @override
  State<DetailWorkOrderAssets> createState() => _DetailWorkOrderAssetsState();
}

class _DetailWorkOrderAssetsState extends State<DetailWorkOrderAssets>
    with TickerProviderStateMixin {
  bool darkMode = false;
  DateFormat formatHour = DateFormat(formatDateTimeString);
  String domain = '';
  bool isExpanded = false;
  bool isExpanded2 = false;
  bool isChooseOpen = true;
  bool isChooseDone = false;
  bool isChooseOnHold = false;
  bool isChooseInProgress = false;
  late AnimationController controller3;
  final double progress = 0.96;
  late TimerBloc timerBloc;
  int count = 0;
  Timer? timer;
  @override
  void dispose() {
    controller3.dispose();
    timer?.cancel();
    super.dispose();
  }

  countTime() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          count++;
        });
      },
    );
  }

  @override
  void initState() {
    getDomain();

    controller3 = AnimationController(
      vsync: this,
      upperBound: progress,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller3.forward();
    timerBloc = BlocProvider.of<TimerBloc>(context);
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

  button(context, state) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 100,
        color: grey100,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: count == 0
            ? ElevatedCpn(
                function: () {
                  countTime();
                },
                bgColor: orange,
                boxShadow: [
                  BoxShadow(
                      color: orange.withOpacity(0.4),
                      offset: const Offset(0, 10),
                      blurRadius: 20)
                ],
                textButton: LocaleKeys.start.tr(),
                leftWidget: const Icon(Icons.schedule_outlined),
                textStyle: h5(color: grey100, fontWeight: '700'),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work time',
                        style: h5(context: context, fontWeight: '700'),
                      ),
                      Text(
                        '$count',
                        style: h5(context: context, fontWeight: '700'),
                      ),
                    ],
                  ),
                  ElevatedCpn(
                    vertical: 10,
                    function: () {
                      setState(() {
                        count = 0;
                      });
                    },
                    textButton: 'Stop',
                    bgColor: redLight,
                    leftWidget: const Icon(Icons.stop_circle_outlined),
                    textStyle:
                        h5(color: Theme.of(context).color12, fontWeight: '700'),
                  ),
                  ElevatedCpn(
                    vertical: 10,
                    horizontal: 5,
                    function: () {},
                    textButton: 'Resume',
                    leftWidget: const Icon(Icons.stop_circle_outlined),
                    textStyle:
                        h5(color: Theme.of(context).color12, fontWeight: '700'),
                  ),
                ],
              ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 33),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                style: h1(context: context, fontWeight: '700'),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionBox(
                paddingHorizontal: 0,
                icon: line,
                title: 'Status',
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChooseOpen = true;
                            isChooseOnHold = false;
                            isChooseInProgress = false;
                            isChooseDone = false;
                          });
                        },
                        child: AppWidget.people(context, icLock, 'Open',
                            selected: isChooseOpen),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChooseOnHold = true;
                            isChooseOpen = false;
                            isChooseInProgress = false;
                            isChooseDone = false;
                          });
                        },
                        child: AppWidget.people(context, icPause, 'On Hold',
                            selected: isChooseOnHold),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChooseInProgress = true;
                            isChooseOpen = false;
                            isChooseOnHold = false;
                            isChooseDone = false;
                          });
                        },
                        child: AppWidget.people(context, icSync, 'In Progress',
                            selected: isChooseInProgress),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChooseDone = true;
                            isChooseInProgress = false;
                            isChooseOpen = false;
                            isChooseOnHold = false;
                          });
                        },
                        child: AppWidget.people(context, icCheck, 'Done',
                            selected: isChooseDone),
                      ),
                    ],
                  )
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: color4.withOpacity(0.04),
                        offset: const Offset(0, 5),
                        blurRadius: 10)
                  ], color: grey100, borderRadius: BorderRadius.circular(16)),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    backgroundColor: backgroundWhite,
                    onExpansionChanged: (bool expanded) {
                      setState(() => isExpanded = expanded);
                    },
                    leading: Container(
                      width: 32,
                      height: 32,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: tiffanyBlue.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const ImageAsset(line, color: tiffanyBlue),
                    ),
                    trailing: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: tiffanyBlue,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: isExpanded
                            ? const Icon(
                                Icons.expand_less,
                                color: Colors.white,
                                size: 20,
                              )
                            : const Icon(Icons.expand_more,
                                color: Colors.white, size: 20)),
                    title: Text('Additional Information',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: h11(context: context, fontWeight: '700')),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidget.divider2(color: grey300),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style:
                                      h5(context: context, fontWeight: '700'),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: Text(
                                    'Late falling of milk teeth on a child, resulting in two rows of milk and permanent teeth at the same time, what could help?',
                                    style: h5(
                                      context: context,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.network(
                                      'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                      width: 90,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                      width: 90,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                      width: 90,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                                AppWidget.divider2(color: grey300),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Due Date',
                                          style: h5(
                                              context: context,
                                              fontWeight: '700'),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          formatHour.format(DateTime.now()),
                                          style: h5(
                                              context: context, color: grey700),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Assign To',
                                          style: h5(
                                            context: context,
                                            fontWeight: '700',
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                                width: 32,
                                                height: 32,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 12,
                                            ),
                                            Text(
                                              'Thanh Le',
                                              style: h5(
                                                  context: context,
                                                  color: grey700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Location',
                                  style: h5(
                                    context: context,
                                    fontWeight: '700',
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Xưởng sản xuất - Chuyền cắt phôi',
                                    style: h5(context: context, color: grey700),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  'Assets',
                                  style: h5(
                                    context: context,
                                    fontWeight: '700',
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    'Thiết bị cấp phôi Parent: Máy cắt thuỷ lực 150 tấn',
                                    style: h5(
                                      context: context,
                                      color: grey700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Theme(
                data: Theme.of(context).copyWith(dividerColor: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: color4.withOpacity(0.04),
                        offset: const Offset(0, 5),
                        blurRadius: 10)
                  ], color: grey100, borderRadius: BorderRadius.circular(16)),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    backgroundColor: backgroundWhite,
                    onExpansionChanged: (bool expanded) {
                      setState(() => isExpanded2 = expanded);
                    },
                    leading: Container(
                      width: 32,
                      height: 32,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: tiffanyBlue.withOpacity(0.16),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const ImageAsset(line, color: tiffanyBlue),
                    ),
                    trailing: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: tiffanyBlue,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: isExpanded2
                            ? const Icon(
                                Icons.expand_less,
                                color: Colors.white,
                                size: 20,
                              )
                            : const Icon(Icons.expand_more,
                                color: Colors.white, size: 20)),
                    title: Text('Procedure',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: h11(context: context, fontWeight: '700')),
                    children: [
                      Column(
                        children: [
                          AppWidget.divider2(color: grey300),
                          AnimationClick(
                            function: () {
                              Navigator.of(context).pushNamed(
                                Routes.checkListWorkOrderAssets,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const WorkOrderCompleteWidget(
                                        width: 130,
                                        height: 130,
                                        lineWidth: 8,
                                        current: 4,
                                        title: 'Tiến độ',
                                        total: 6,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Text(
                                              'Máy cắt thuỷ lực 150 tấn - Checklist Kiểm tra đầu giờ 01',
                                              style: h5(
                                                  context: context,
                                                  fontWeight: '700'),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '4 of 6 completed',
                                            style: h5(
                                                context: context,
                                                color: grey700),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      IconButtonCpn(
                                        path: icFollow,
                                        hasOutline: false,
                                        bgColor: border.withOpacity(0.2),
                                        iconColor: grayBlue,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Time & Cost tracking',
                style: h5(context: context, fontWeight: '700'),
              ),
              BottomCustom(
                backgroundColor: grey100,
                childInside: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Parts',
                        style: h4(
                            context: context, fontWeight: '700', color: black),
                      ),
                      AppWidget.divider2(color: grey200),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '[VT0004] Rod U Packing',
                                style: h11(
                                  context: context,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  '2',
                                  style: h11(context: context),
                                ),
                              ),
                            ],
                          ),
                          AppWidget.divider2(color: grey200),
                          Row(
                            children: [
                              Text(
                                '[VT0005] Piston seal',
                                style: h11(context: context),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  '1',
                                  style: h11(context: context),
                                ),
                              ),
                            ],
                          ),
                          AppWidget.divider2(color: grey200),
                          Row(
                            children: [
                              Text(
                                '[VT0006] Reducing Vavle (Besko)',
                                style: h11(context: context),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  '4',
                                  style: h11(context: context),
                                ),
                              ),
                            ],
                          ),
                          AppWidget.divider2(color: grey200),
                          Row(
                            children: [
                              Text(
                                '[VT0007] Solenoid Operaed Valve',
                                style: h11(context: context),
                              ),
                              const Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  '2',
                                  style: h11(context: context),
                                ),
                              ),
                            ],
                          ),
                          AppWidget.divider2(color: grey200),
                        ],
                      ),
                    ],
                  ),
                ),
                childShowBottom: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 23,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: color4.withOpacity(0.04),
                        offset: const Offset(0, 5),
                        blurRadius: 16)
                  ], color: grey100, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Text(
                        'Parts',
                        style: h5(context: context, fontWeight: '700'),
                      ),
                      const Spacer(),
                      Text(
                        '[VT0004] Rod U Packing, +3',
                        style: h5(context: context, color: dodgerBlue),
                      ),
                    ],
                  ),
                ),
              ),
              BottomCustom(
                  backgroundColor: grey100,
                  childInside: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          LocaleKeys.time.tr(),
                          style: h5(context: context, fontWeight: '700'),
                        ),
                        AppWidget.divider2(color: grey200),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My Time',
                                  style:
                                      h5(context: context, color: dodgerBlue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '2h 30m 55s',
                                  style:
                                      h5(context: context, color: dodgerBlue),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppWidget.divider2(color: grey200),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TotaL Time',
                                  style:
                                      h5(context: context, color: dodgerBlue),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '4h 10m 25s',
                                  style:
                                      h5(context: context, color: dodgerBlue),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  childShowBottom: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: color4.withOpacity(0.04),
                          offset: const Offset(0, 5),
                          blurRadius: 16)
                    ], color: grey100, borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Text(
                          'Time',
                          style: h5(context: context, fontWeight: '700'),
                        ),
                        const Spacer(),
                        Text(
                          '2h 30m 55s',
                          style: h5(context: context, color: dodgerBlue),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
