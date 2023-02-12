import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';

class WorkOrderCompleteWidget extends StatefulWidget {
  const WorkOrderCompleteWidget({
    Key? key,
    this.color,
    required this.current,
    required this.title,
    required this.total,
    this.lineWidth,
    this.width,
    this.height,
  }) : super(key: key);
  final double total;
  final double current;
  final String title;
  final double? width;
  final double? height;
  final double? lineWidth;
  final Color? color;
  @override
  State<WorkOrderCompleteWidget> createState() =>
      _WorkOrderCompleteWidgetState();
}

class _WorkOrderCompleteWidgetState extends State<WorkOrderCompleteWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      upperBound: (widget.total - widget.current) / 10,
      duration: const Duration(seconds: 1),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var num = widget.total - widget.current;
    return Stack(alignment: Alignment.center, children: [
      Container(
        padding: const EdgeInsets.all(12),
        width: widget.width ?? 96,
        height: widget.height ?? 96,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: grey100,
        ),
        child: CircularProgressIndicator(
            strokeWidth: widget.lineWidth ?? 8,
            value: controller.value,
            semanticsLabel: 'Linear progress indicator',
            backgroundColor: isabelline,
            color: widget.color ?? greenDeep),
      ),
      Text(num.toStringAsFixed(0),
          style: h0(
            color: greenDeep,
          ))
    ]);
  }
}
