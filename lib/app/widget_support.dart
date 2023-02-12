// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;

mixin AppWidget {
  static double getHeightScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidthScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getBottomIndicator(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static Widget divider() {
    return Container(
      width: double.infinity,
      height: 1,
      decoration: BoxDecoration(
        gradient: linear,
      ),
    );
  }

  static Future<Position> getCurrentLocation() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  static Widget divider2({Color? color}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      height: 1.1,
      color: color ?? backgroundColor2,
    );
  }

  static Widget people(BuildContext context, String icon, String title,
      {required bool selected}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              boxShadow: selected
                  ? [
                      BoxShadow(
                          color: dodgerBlue.withOpacity(0.3),
                          offset: const Offset(0, 10),
                          blurRadius: 20)
                    ]
                  : [],
              color: selected ? dodgerBlue : backgroundColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: selected ? dodgerBlue : border)),
          child: ImageAsset(
            icon,
            width: 24,
            height: 24,
            color: selected ? grey100 : grayBlue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            title,
            style: h6(context: context, fontWeight: selected ? '700' : '400'),
          ),
        )
      ],
    );
  }

  static Future<BitmapDescriptor> getCustomIcon(GlobalKey iconKey) async {
    Future<Uint8List?> capturePng(GlobalKey iconKey) async {
      try {
        RenderRepaintBoundary boundary =
            iconKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 4);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();
        return pngBytes;
      } catch (e) {
        print(e);
        return null;
      }
    }

    Uint8List? imageData = await capturePng(iconKey);
    return BitmapDescriptor.fromBytes(imageData!);
  }
}
