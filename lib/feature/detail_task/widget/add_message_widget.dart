import 'package:flutter/material.dart';
import 'package:cmms/app/widget_support.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/button/elevated_cpn.dart';
import 'package:cmms/common/widget/button/outlined_cpn.dart';
import 'package:cmms/common/widget/text_field/textfield.dart';
import 'package:cmms/translations/export_lang.dart';

class AddWidget extends StatefulWidget {
  String idTask;
  Function func;
  String title;
  String hintText;
  String lableText;
  int typeAdd;
  AddWidget(
      {Key? key,
      required this.idTask,
      required this.func,
      required this.title,
      required this.hintText,
      required this.lableText,
      required this.typeAdd})
      : super(key: key);

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  TextEditingController mesageCtl = TextEditingController();
  FocusNode mesageFn = FocusNode();
  late DateTime birthday;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    mesageCtl.dispose();
    mesageFn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      height: height / 3 * 2,
      child: ListView(
        children: [
          Text(
            widget.title,
            style: h3(context: context, fontWeight: '700'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24, top: 40),
            child: TextFieldCpn(
              controller: mesageCtl,
              hintText: widget.hintText,
              focusNode: mesageFn,
              labelText: widget.lableText,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedCpn(
                  function: (() => {Navigator.of(context).pop()}),
                  textButton: LocaleKeys.cancel.tr(),
                  icon: const Icon(
                    Icons.more_horiz,
                    color: grey500,
                  ),
                  borderColor: grey400,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedCpn(
                  bgColor: tiffanyBlue,
                  function: () {
                    if (mesageCtl.text != '') {
                      widget.func(mesageCtl.text);
                      Navigator.of(context).pop();
                    }
                  },
                  textButton: LocaleKeys.add.tr(),
                  textStyle:
                      h5(color: Theme.of(context).color12, fontWeight: '700'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
