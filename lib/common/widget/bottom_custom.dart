import 'package:flutter/material.dart';
import 'package:cmms/app/animation_click.dart';

class BottomCustomController {
  void show(BuildContext context, Color? backgroundColor, Widget childInside) {
    showModalBottomSheet<dynamic>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        context: context,
        backgroundColor: backgroundColor,
        isScrollControlled: true,
        builder: (context) {
          return childInside;
        });
  }
}

class BottomCustom extends StatelessWidget {
  const BottomCustom({
    Key? key,
    this.childShowBottom = const SizedBox(),
    this.childInside = const SizedBox(),
    this.backgroundColor,
    this.controller,
  }) : super(key: key);
  final Widget childShowBottom;
  final Widget childInside;
  final Color? backgroundColor;
  final BottomCustomController? controller;

  @override
  Widget build(BuildContext context) {
    BottomCustomController bottomController =
        controller ?? BottomCustomController();
    return AnimationClick(
      function: () {
        bottomController.show(context, backgroundColor, childInside);
      },
      child: childShowBottom,
    );
  }
}
