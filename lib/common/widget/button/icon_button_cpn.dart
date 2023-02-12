import 'package:flutter/material.dart';
import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/widget/image.dart';

class IconButtonCpn extends StatelessWidget {
  const IconButtonCpn({
    Key? key,
    required this.path,
    this.bgColor,
    this.hasOutline = true,
    this.borderColor,
    this.function,
    this.paddingAll = 8,
    this.widthIcon,
    this.heightIcon,
    this.iconColor,
    this.icon,
    this.borderRadius = 12,
  }) : super(key: key);
  final String path;
  final Color? bgColor;
  final bool hasOutline;
  final Color? iconColor;
  final Color? borderColor;
  final Function()? function;
  final double paddingAll;
  final double borderRadius;
  final double? widthIcon;
  final double? heightIcon;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return AnimationClick(
        function: function ?? () {},
        child: Container(
          padding: EdgeInsets.all(paddingAll),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: hasOutline ? null : bgColor,
            border: hasOutline
                ? Border.fromBorderSide(
                    BorderSide(color: borderColor ?? border))
                : null,
          ),
          child: icon != null
              ? Icon(
                  icon,
                  color: iconColor,
                )
              : ImageAsset(
                  path,
                  color: iconColor,
                  width: widthIcon ?? 24,
                  height: heightIcon ?? 24,
                ),
        ));
  }
}
