import 'package:flutter/material.dart';
import 'custom_curve.dart';

class RipplesAnimation extends StatefulWidget {
  const RipplesAnimation({Key? key, this.size, this.color, this.icon})
      : super(key: key);
  final double? size;
  final Color? color;
  final String? icon;
  @override
  State<StatefulWidget> createState() => _RipplesAnimationState();
}

class _RipplesAnimationState extends State<RipplesAnimation>
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
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: ScaleTransition(
          scale: Tween(begin: 0.95, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const CurveWave(),
            ),
          ),
          child: Image.asset(
            widget.icon!,
          )),
    );
  }
}
