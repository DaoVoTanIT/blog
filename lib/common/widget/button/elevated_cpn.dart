import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';

class ElevatedCpn extends StatelessWidget {
  const ElevatedCpn(
      {Key? key,
      required this.textButton,
      this.bgColor,
      this.borderRadius,
      this.horizontal,
      this.gradient,
      this.leftWidget = const SizedBox(),
      this.rightWidget = const SizedBox(),
      this.miniumSize,
      this.function,
      this.textStyle,
      this.boxShadow,
      this.vertical,
      this.disabled = false,
      this.icon,
      this.width,
      this.height})
      : super(key: key);
  final String? textButton;
  final Icon? icon;
  final double? vertical;
  final double? horizontal;
  final double? borderRadius;
  final Color? bgColor;
  final LinearGradient? gradient;
  final List<BoxShadow>? boxShadow;
  final Size? miniumSize;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final TextStyle? textStyle;
  final Function()? function;
  final bool disabled;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        gradient: disabled ? null : gradient,
        color: disabled ? isabelline : null,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
      ),
      child: ElevatedButton(
        onPressed: !disabled ? function ?? () {} : () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(
                  vertical: vertical ?? 15, horizontal: horizontal ?? 13)),
          minimumSize: MaterialStateProperty.all(miniumSize),
          backgroundColor: MaterialStateProperty.all(
              gradient == null ? bgColor : Colors.transparent),
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
                      style: textStyle ??
                          h5(
                            context: context,
                            color: disabled ? grayBlue : grey100,
                            fontWeight: disabled ? '400' : '700',
                          ),
                    ),
            ),
            rightWidget!
          ],
        ),
      ),
    );
  }
}
