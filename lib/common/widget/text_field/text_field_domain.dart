import 'package:flutter/material.dart';
import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/styles.dart';

class TextFieldDomain extends StatelessWidget {
  const TextFieldDomain({
    required this.controller,
    required this.focusNode,
    this.labelText,
    this.isError = false,
    this.showSuffixIcon = false,
    this.showPrefixIcon = false,
    this.colorSuffixIcon,
    this.colorPrefixIcon,
    this.suffixIcon,
    this.prefixIcon,
    this.focusNext,
    this.hasMutilLine = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.functionPrefix,
    this.functionSuffer,
    this.enabled = true,
    this.hintText,
    this.labelStyle,
    this.onChanged,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final String? labelText;
  final bool showSuffixIcon;
  final bool isError;
  final bool showPrefixIcon;
  final String? prefixIcon;
  final Color? colorPrefixIcon;
  final Widget? suffixIcon;
  final Color? colorSuffixIcon;
  final bool hasMutilLine;
  final bool readOnly;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Function()? functionPrefix;
  final Function()? functionSuffer;
  final Function(String)? onChanged;
  final String? hintText;
  final TextStyle? labelStyle;

  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color ?? isabelline));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText!.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  labelText!,
                  style: labelStyle ?? h7(context: context, fontWeight: '600'),
                ),
              ),
        TextField(
            controller: controller,
            focusNode: focusNode,
            maxLines: maxLines ?? (hasMutilLine ? null : 1),
            minLines: minLines,
            readOnly: readOnly,
            maxLength: maxLength,
            cursorColor: goGreen,
            keyboardType:
                hasMutilLine ? TextInputType.multiline : TextInputType.text,
            onSubmitted: (value) {
              focusNode.unfocus();
              FocusScope.of(context).requestFocus(focusNext);
            },
            onChanged: onChanged ?? (value) {},
            style: h4(context: context, fontWeight: '600'),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: h4(color: grayBlue),
              fillColor: grey100,
              filled: true,
              contentPadding: const EdgeInsets.all(12),
              prefixIcon: showPrefixIcon
                  ? AnimationClick(
                      function: functionPrefix ?? () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Image.asset(
                          prefixIcon ?? calendar,
                          height: 24,
                          width: 24,
                          color: colorPrefixIcon ?? goGreen,
                        ),
                      ),
                    )
                  : const SizedBox(),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              suffixIcon: showSuffixIcon
                  ? AnimationClick(
                      function: functionSuffer ?? () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: suffixIcon,
                        // child: Image.asset(
                        //   suffixIcon ?? calendar,
                        //   height: 24,
                        //   width: 24,
                        //   color: colorSuffixIcon ?? dodgerBlue,
                        // ),
                      ),
                    )
                  : const SizedBox(),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              focusedBorder: createInputDecoration(context,
                  color: isError ? neonFuchsia : goGreen),
              enabledBorder: createInputDecoration(context),
              errorBorder: createInputDecoration(context, color: neonFuchsia),
              enabled: enabled,
            )),
      ],
    );
  }
}
