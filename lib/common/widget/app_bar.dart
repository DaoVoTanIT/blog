import 'package:flutter/material.dart';
import 'package:cmms/common/constant/images.dart';
import 'button/icon_button_cpn.dart';

class AppBarCpn extends StatelessWidget with PreferredSizeWidget {
  const AppBarCpn(
      {Key? key,
      this.size,
      this.child,
      this.center,
      this.right,
      this.color = Colors.transparent,
      this.bottom,
      this.iconLeft = icBack,
      this.left})
      : super(key: key);
  final Size? size;
  final Widget? child;
  final String iconLeft;
  final Widget? center;
  final Widget? right;
  final Color color;
  final Widget? bottom;
  final Widget? left;

  @override
  Size get preferredSize => size ?? const Size.fromHeight(kToolbarHeight + 240);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(color: color),
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 8,
              left: 24,
              bottom: 16,
              right: 24,
            ),
            child: child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    left ??
                        IconButtonCpn(
                            path: iconLeft,
                            function: () {
                              Navigator.of(context).pop();
                            }),
                    center ?? const SizedBox(),
                    right ?? const SizedBox(width: 24),
                  ],
                ),
          ),
          Container(
            decoration: BoxDecoration(color: color),
            child: bottom ?? const SizedBox(),
          )
        ],
      ),
    );
  }
}
