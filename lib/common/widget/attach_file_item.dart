import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/model/attachment_model.dart';
import 'package:cmms/common/widget/image.dart';
import 'package:cmms/translations/export_lang.dart';

class AttachFileItem extends StatelessWidget {
  const AttachFileItem(
      {Key? key, required this.attachFile, this.height, this.width})
      : super(key: key);
  final AttachmentModel attachFile;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageAsset(
          attachFile.image,
          width: width ?? 100,
          height: height ?? 72,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                attachFile.description,
                style: h6(context: context),
              ),
              Text(
                "${LocaleKeys.uploaded.tr()} ${DateFormat('MMM d, yyyy').format(attachFile.time ?? DateTime.now())}",
                style: h6(color: grayBlue),
              ),
            ],
          ),
        )
      ],
    );
  }
}
