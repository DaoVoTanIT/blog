import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({
    Key? key,
    this.child,
    this.color = grey100,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  final Widget? child;
  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 16,
            offset: Offset(0, 2),
            color: Color.fromRGBO(0, 64, 128, 0.04),
          )
        ],
      ),
      child: child,
    );
  }
}
