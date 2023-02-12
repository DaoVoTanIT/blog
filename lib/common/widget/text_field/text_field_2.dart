import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';

class TextField2Cpn extends StatelessWidget {
  const TextField2Cpn({
    required this.controller,
    required this.focusNode,
    this.focusNext,
    this.hasMutilLine = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.enabled = true,
    this.hintText,
    this.hintStyle,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final bool hasMutilLine;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? hintText;
  final TextStyle? hintStyle;

  OutlineInputBorder createInputDecoration(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: backgroundColor));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        focusNode: focusNode,
        cursorColor: goGreen,
        maxLines: maxLines ?? (hasMutilLine ? null : 1),
        minLines: minLines,
        readOnly: readOnly,
        maxLength: maxLength,
        keyboardType:
            hasMutilLine ? TextInputType.multiline : TextInputType.text,
        onSubmitted: (value) {
          focusNode.unfocus();
          FocusScope.of(context).requestFocus(focusNext);
        },
        style: h1(context: context, fontWeight: '700'),
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: backgroundColor,
          hintStyle: hintStyle ?? h1(color: border, fontWeight: '700'),
          contentPadding: const EdgeInsets.all(12),
          focusedBorder: createInputDecoration(context),
          enabledBorder: createInputDecoration(context),
          enabled: enabled,
        ));
  }
}
