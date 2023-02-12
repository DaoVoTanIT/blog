import 'package:flutter/cupertino.dart';
import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/translations/export_lang.dart';

class MenuOption extends StatelessWidget {
  const MenuOption(
      {Key? key, required this.childInside, this.actions, this.barrierColor})
      : super(key: key);
  final List<Widget>? actions;
  final Widget childInside;
  final Color? barrierColor;

  @override
  Widget build(BuildContext context) {
    return AnimationClick(
      function: () {
        showCupertinoModalPopup<void>(
          context: context,
          barrierColor: barrierColor ?? black.withOpacity(0.68),
          builder: (BuildContext context) => CupertinoActionSheet(
            actions: actions ??
                <Widget>[
                  Container(
                    color: grey100,
                    child: CupertinoActionSheetAction(
                      child: Text(
                        LocaleKeys.consultInformation.tr(),
                        style: h5(fontWeight: '600', context: context),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    color: grey100,
                    child: CupertinoActionSheetAction(
                      child: Text(
                        LocaleKeys.sharedFile.tr(),
                        style: h5(fontWeight: '600', context: context),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    color: grey100,
                    child: CupertinoActionSheetAction(
                      child: Text(
                        LocaleKeys.finishThisConsult.tr(),
                        style: h5(fontWeight: '600', color: neonFuchsia),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                LocaleKeys.cancel.tr(),
                style: h5(fontWeight: '600', color: grayBlue),
              ),
            ),
          ),
        );
      },
      child: childInside,
    );
  }
}
