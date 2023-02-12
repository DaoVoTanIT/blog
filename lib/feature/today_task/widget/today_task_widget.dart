import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/translations/export_lang.dart';

class TodayWorkOrderWidget extends StatefulWidget {
  const TodayWorkOrderWidget(
      {Key? key,
      this.total = 0,
      this.current = 0,
      required this.title,
      required this.title2})
      : super(key: key);
  final int total;
  final int current;
  final String title;
  final String title2;

  @override
  State<TodayWorkOrderWidget> createState() => _TodayWorkOrderWidgetState();
}

class _TodayWorkOrderWidgetState extends State<TodayWorkOrderWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      upperBound: widget.total == 0 ? 0 : (widget.current) / widget.total,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: widget.title.isEmpty
                  ? Text(
                      widget.title2,
                      style: h1(context: context),
                    )
                  : RichText(
                      text: TextSpan(
                        text: '${widget.title} ',
                        style: h1(context: context, fontWeight: '700'),
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.title2,
                            style: h1(context: context),
                          )
                        ],
                      ),
                    ),
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '${widget.current} ',
                    style: h6(context: context, color: grayBlue),
                  ),
                  TextSpan(
                    text: '${LocaleKeys.of.tr()} ',
                    style: h6(context: context, color: grayBlue),
                  ),
                  TextSpan(
                    text: '${widget.total} ',
                    style: h6(context: context, color: grayBlue),
                  ),
                  TextSpan(
                    text: LocaleKeys.completed.tr(),
                    style: h6(context: context, color: grayBlue),
                  )
                ],
              ),
            ),
          ],
        ),
        Stack(alignment: Alignment.center, children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: grey100,
            ),
            child: CircularProgressIndicator(
                strokeWidth: 8,
                value: controller.value,
                semanticsLabel: 'Linear progress indicator',
                backgroundColor: isabelline,
                color: greenDeep),
          ),
          Text('${widget.current}',
              style: h0(color: greenDeep, hasUnderLine: true))
        ]),
      ],
    );
  }
}
