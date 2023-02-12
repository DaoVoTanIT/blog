import 'package:flutter/material.dart';
import 'circle_painter.dart';
import 'custom_curve.dart';

class AnimationCalling extends StatefulWidget {
  const AnimationCalling(
      {Key? key,
      required this.size,
      required this.color,
      required this.icon,
      required this.widthIcon,
      required this.heightIcon})
      : super(key: key);
  final double size;
  final Color color;
  final String icon;
  final double widthIcon;
  final double heightIcon;
  @override
  State<StatefulWidget> createState() => _AnimationCallingState();
}

class _AnimationCallingState extends State<AnimationCalling>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(
        _controller,
        color: widget.color,
      ),
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Center(
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const CurveWave(),
                ),
              ),
              child: Image.asset(
                widget.icon,
                height: widget.heightIcon,
                width: widget.widthIcon,
              )),
        ),
      ),
    );
  }
}
