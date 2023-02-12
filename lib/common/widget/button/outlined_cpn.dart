import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';

class OutlinedCpn extends StatelessWidget {
  const OutlinedCpn(
      {Key? key,
      required this.textButton,
      this.bgColor,
      this.borderRadius,
      this.horizontal,
      this.leftWidget = const SizedBox(),
      this.rightWidget = const SizedBox(),
      this.miniumSize,
      this.function,
      this.textStyle,
      this.borderColor,
      this.boxShadow,
      this.icon,
      this.vertical})
      : super(key: key);
  final String? textButton;
  final Icon? icon;
  final double? vertical;
  final double? horizontal;
  final double? borderRadius;
  final Color? bgColor;
  final List<BoxShadow>? boxShadow;
  final Size? miniumSize;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      child: OutlinedButton(
        onPressed: function ?? () {},
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: borderColor ?? border)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(bgColor ?? Colors.transparent),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                  vertical: vertical ?? 15, horizontal: horizontal ?? 13)),
          minimumSize: MaterialStateProperty.all(miniumSize),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftWidget!,
            Padding(
              padding: EdgeInsets.only(
                  left: leftWidget == null ? 0 : 12,
                  right: rightWidget == null ? 0 : 12),
              child: textButton == null
                  ? icon
                  : Text(
                      textButton!,
                      style: textStyle ?? h5(context: context),
                    ),
            ),
            rightWidget!
          ],
        ),
      ),
    );
  }
}
