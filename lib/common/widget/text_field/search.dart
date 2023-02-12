import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/images.dart';
import 'package:cmms/common/constant/styles.dart';

import '../image.dart';

class SearchCpn extends StatelessWidget {
  const SearchCpn({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.showResetSearchIcon = false,
    this.onChanged,
    this.onSubmitted,
    this.fillColor = isabelline,
    this.showIconSearch = true,
    this.hasShadow = true,
    this.iconPrefix,
    this.hintText = 'Enter country name, code...',
    this.enabled = true,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool showResetSearchIcon;
  final bool showIconSearch;
  final String? iconPrefix;
  final Color fillColor;
  final bool hasShadow;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: hasShadow ? const Color.fromRGBO(0, 64, 128, 0.04) : null,
      child: TextField(
          enabled: enabled,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged ?? (value) {},
          cursorColor: goGreen,
          onSubmitted: onSubmitted ??
              (value) {
                focusNode.unfocus();
              },
          style: h4(context: context, fontWeight: '600'),
          decoration: InputDecoration(
              isDense: true,
              prefixIcon: showIconSearch
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ImageAsset(
                        iconPrefix ?? icSearch,
                        height: 24,
                        width: 24,
                        color: grayBlue,
                      ),
                    )
                  : const SizedBox(
                      width: 12,
                    ),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 24,
                minWidth: 24,
              ),
              hintText: hintText,
              filled: true,
              fillColor: fillColor,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: goGreen)),
              contentPadding: const EdgeInsets.all(12),
              hintStyle: h7(color: grayBlue),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none))),
    );
  }
}
