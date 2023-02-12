import 'dart:async';

import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/util/format_time.dart';
import 'package:cmms/common/widget/button/icon_button_cpn.dart';
import 'package:cmms/feature/detail_work_order/detail_work_order_bloc/timer/bloc/timer.dart';
import 'package:cmms/feature/detail_work_order/repository/ticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Woking extends StatefulWidget {
  const Woking({super.key});
  @override
  State<Woking> createState() => _WokingState();
}

class _WokingState extends State<Woking> {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  String digitSeconds = '00';
  String digitMinutes = '00';
  String digitHours = '00';
  List laps = [];
  Timer? timer;
  bool started = false;
  bool pause = false;
  TimerBloc timerBloc = TimerBloc(ticker: const Ticker());
  @override
  void initState() {
    timerBloc.add(TimerStarted(duration: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Work Order Processing',
            style: h1(context: context, fontWeight: '700'),
          ),
          const SizedBox(
            height: 20,
          ),
          AppWidget.divider2(color: backgroundColor3),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                style:
                    h5(context: context, fontWeight: '700', color: dodgerBlue),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '#WO1122/2022',
                style: h7(context: context, fontWeight: '700'),
              ),
              BlocProvider(
                create: (_) => TimerBloc(ticker: const Ticker()),
                child: BlocBuilder<TimerBloc, TimerState>(
                    buildWhen: (prev, state) =>
                        prev.runtimeType != state.runtimeType,
                    builder: (context, state) {
                      if (state is TimerInitial) {
                        context
                            .read<TimerBloc>()
                            .add(TimerStarted(duration: state.duration));
                      }
                      final duration = context
                          .select((TimerBloc bloc) => bloc.state.duration);

                      return Container(
                        //  / height: 100,
                        // color: grey100,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: grey300.withOpacity(0.4),
                                offset: const Offset(0, 5),
                                blurRadius: 20)
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Work time',
                                    style:
                                        h5(context: context, fontWeight: '700'),
                                  ),
                                  Text(
                                    FormatTime.convertTime(duration),
                                    style:
                                        h1(context: context, fontWeight: '700'),
                                  ),
                                ],
                              ),
                              if (state is TimerRunInProgress) ...[
                                const Spacer(),
                                IconButtonCpn(
                                  function: () => context
                                      .read<TimerBloc>()
                                      .add(const TimerReset()),
                                  paddingAll: 15,
                                  hasOutline: false,
                                  bgColor: redLight,
                                  path: icStop,
                                  iconColor: backgroundWhite,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButtonCpn(
                                  paddingAll: 15,
                                  function: () => context
                                      .read<TimerBloc>()
                                      .add(const TimerPaused()),
                                  hasOutline: false,
                                  bgColor: yellow500,
                                  path: icPause,
                                  iconColor: backgroundWhite,
                                ),
                              ],
                              if (state is TimerRunPause) ...[
                                const Spacer(),
                                IconButtonCpn(
                                  function: () => context
                                      .read<TimerBloc>()
                                      .add(const TimerReset()),
                                  paddingAll: 15,
                                  hasOutline: false,
                                  bgColor: redLight,
                                  path: icStop,
                                  iconColor: backgroundWhite,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButtonCpn(
                                  paddingAll: 15,
                                  function: () => context
                                      .read<TimerBloc>()
                                      .add(const TimerResumed()),
                                  hasOutline: false,
                                  bgColor: tiffanyBlue,
                                  path: icPlay,
                                  iconColor: backgroundWhite,
                                ),
                              ],
                            ]),
                      );
                    }),
              )
            ],
          ),

          // Row(
          //   children: [
          //     Expanded(
          //       child: OutlinedCpn(
          //         function: () {
          //           Navigator.of(context).pop();
          //         },
          //         textButton: 'Cancel',
          //         textStyle: h5(color: grayBlue, fontWeight: '700'),
          //       ),
          //     ),
          //     const SizedBox(width: 16),
          //     Expanded(
          //       child: ElevatedCpn(
          //         function: () {
          //           Navigator.of(context)
          //               .pushNamed(Routes.stepTwo, arguments: const StepTwo());
          //         },
          //         gradient: linear,
          //         textButton: 'Continue',
          //         textStyle: h5(color: grey100, fontWeight: '700'),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
