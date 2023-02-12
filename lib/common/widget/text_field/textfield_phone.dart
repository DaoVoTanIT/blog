import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/util/country_code_custom.dart';

class TextFieldPhone extends StatelessWidget {
  const TextFieldPhone({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;

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
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            labelText,
            style: h7(context: context, fontWeight: '600'),
          ),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                  color: grey100,
                  borderRadius: BorderRadius.circular(12),
                  border: const Border.fromBorderSide(
                      BorderSide(color: isabelline))),
              child: CountryCodeCustom(
                onChanged: (value) {},
                builder: (value) {
                  return SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          Image.asset(
                            value!.flagUri!,
                            package: 'country_code_picker',
                            height: 16,
                            width: 28,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              value.dialCode!,
                              style: h4(context: context),
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 24,
                            color: blueCrayola,
                          )
                        ],
                      ));
                },
              ),
            ),
            Expanded(
              child: TextField(
                  controller: controller,
                  cursorColor: goGreen,
                  focusNode: focusNode,
                  keyboardType: TextInputType.phone,
                  style: h4(context: context, fontWeight: '600'),
                  decoration: InputDecoration(
                    fillColor: grey100,
                    filled: true,
                    contentPadding: const EdgeInsets.all(12),
                    focusedBorder:
                        createInputDecoration(context, color: goGreen),
                    enabledBorder: createInputDecoration(context),
                  )),
            )
          ],
        )
      ],
    );
  }
}
