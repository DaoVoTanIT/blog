import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/translations/export_lang.dart';

class TaskCompleteLevelWidget extends StatefulWidget {
  const TaskCompleteLevelWidget(
      {Key? key,
      required this.current,
      required this.title,
      required this.total})
      : super(key: key);
  final double total;
  final double current;
  final String title;

  @override
  State<TaskCompleteLevelWidget> createState() =>
      _TaskCompleteLevelWidgetState();
}

class _TaskCompleteLevelWidgetState extends State<TaskCompleteLevelWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  var formatNumber = NumberFormat('#.00##', 'en_US');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        //  widget.current == 0.0 || widget.total == 0.0
        //     ? Container():
        Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: widget.current == 0.0 || widget.total == 0.0
                        ? '0 %'
                        : '${((widget.current / widget.total) * 100).toStringAsFixed(1)}%',
                    style: h11(context: context, fontWeight: '700'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                text: widget.title,
                style: h8(context: context, fontWeight: '400', color: grey600),
                children: const <TextSpan>[
                  // TextSpan(
                  //   text: LocaleKeys.forToday.tr(),
                  //   style: h1(context: context),
                  // )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Stack(alignment: Alignment.center, children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: grey100,
            ),
            child: CircularProgressIndicator(
                strokeWidth: 5,
                value: widget.total == 0 ? 0 : (widget.current) / widget.total,
                semanticsLabel: 'Linear progress indicator',
                backgroundColor: isabelline,
                color: malachite),
          ),
          // Text('${widget.total - widget.current}',
          //     style: h0(color: tiffanyBlue, hasUnderLine: true))
        ]),
      ],
    );
  }
}
