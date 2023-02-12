import 'package:flutter/material.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/util/completed.dart';
import 'package:cmms/translations/export_lang.dart';

class ChangePassSuccess extends StatelessWidget {
  const ChangePassSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CompletedScreen(
        icon: imgSuccess,
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.login, (route) => false);
        },
        subTitle: LocaleKeys.successChangePass.tr(),
        textButton: LocaleKeys.logInNow.tr(),
        title: LocaleKeys.congrats.tr());
  }
}
