import 'package:cmms/common/constant/images.dart';
import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/widget/image.dart';

BottomNavigationBarItem createItemNav(
    BuildContext context, String pathIcon, String label, bool showNotification,
    {int notifications = 0}) {
  final hasNotification = notifications >= 0;
  // return BottomNavigationBarItem(
  //   activeIcon: hasNotification
  //       ? Notifications(
  //           showNotification: showNotification,
  //           iconPath: pathIcon,
  //           notifications: notifications,
  //           iconColor: tiffanyBlue,
  //           isIcon: true,
  //         )
  //       : ImageAsset(
  //           pathIcon,
  //           color: tiffanyBlue,
  //           width: 30,
  //           height: 30,
  //         ),
  //   icon: hasNotification
  //       ? Notifications(
  //           showNotification: showNotification,
  //           iconPath: pathIcon,
  //           notifications: notifications,
  //           iconColor: grayBlue,
  //           isIcon: true)
  //       : ImageAsset(
  //           pathIcon,
  //           color: grayBlue,
  //           width: 30,
  //           height: 30,
  //         ),
  //   label: label,
  // );
  return BottomNavigationBarItem(
      activeIcon: pathIcon == logoCmms
          ? Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: tiffanyBlue.withOpacity(0.2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ImageAsset(
                  pathIcon,
                ),
              ))
          : Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: tiffanyBlue.withOpacity(0.2),
              ),
              child: ImageAsset(
                pathIcon,
                color: grayBlue,
              )),
      icon: pathIcon == logoCmms
          ? ImageAsset(
              pathIcon,
            )
          : hasNotification
              ? ImageAsset(
                  pathIcon,
                  color: grayBlue,
                )
              : ImageAsset(pathIcon, color: grayBlue),
      label: label);
}
