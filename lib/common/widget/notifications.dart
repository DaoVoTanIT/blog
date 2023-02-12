import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/widget/image.dart';

import 'button/icon_button_cpn.dart';

class Notifications extends StatelessWidget {
  const Notifications(
      {Key? key,
      this.notifications = 0,
      this.iconPath,
      this.iconColor,
      this.bgColor,
      this.isIcon = false,
      this.showNotification = false,
      this.function})
      : super(key: key);

  final int notifications;
  final String? iconPath;
  final Color? bgColor;
  final Color? iconColor;
  final bool isIcon;
  final bool showNotification;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    final over = notifications > 9;
    return Stack(clipBehavior: Clip.none, children: [
      isIcon
          ? ImageAsset(iconPath ?? icNotification,
              color: iconColor ?? neonFuchsia)
          : IconButtonCpn(
              function: function ?? () {},
              bgColor: bgColor ?? grey100,
              path: iconPath ?? icNotification,
              iconColor: iconColor ?? neonFuchsia,
              hasOutline: false,
            ),
      notifications != 0
          ? Positioned(
              top: -5,
              right: -5,
              child: Container(
                padding: EdgeInsets.all(over ? 0 : 1),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: neonFuchsia),
                child: over
                    ? Text(
                        '9+',
                        textAlign: TextAlign.center,
                        style: h9(color: grey100, fontWeight: '600'),
                      )
                    : Text(
                        '$notifications',
                        textAlign: TextAlign.center,
                        style: h8(color: grey100, fontWeight: '600'),
                      ),
              ))
          : showNotification == true
              ? Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    padding: EdgeInsets.all(over ? 0 : 1),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: neonFuchsia),
                  ))
              : const SizedBox()
    ]);
  }
}
