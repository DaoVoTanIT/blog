import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';

class Dropdown extends StatefulWidget {
  const Dropdown(
      {Key? key,
      this.title,
      this.items = const ['1991', '1992', '1993', '1994']})
      : super(key: key);
  final List<String> items;
  final String? title;
  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  late String currentValue = widget.items.first;

  OutlineInputBorder createInputDecoration(BuildContext context,
      {Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? isabelline));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  widget.title!,
                  style: h7(context: context, fontWeight: '600'),
                ),
              )
            : const SizedBox(),
        DecoratedBox(
          decoration: const BoxDecoration(color: grey100),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
                focusedBorder: createInputDecoration(context, color: goGreen),
                enabledBorder: createInputDecoration(context),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            items: widget.items.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: h4(fontWeight: '600', context: context),
                ),
              );
            }).toList(),
            value: currentValue,
            onChanged: (value) {
              setState(() {
                currentValue = value!;
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 24,
              color: dodgerBlue,
            ),
          ),
        ),
      ],
    );
  }
}
