import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';

class TextFieldPassCpn extends StatefulWidget {
  const TextFieldPassCpn({
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.focusNext,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? focusNext;
  final String labelText;

  @override
  State<TextFieldPassCpn> createState() => _TextFieldPassCpnState();
}

class _TextFieldPassCpnState extends State<TextFieldPassCpn> {
  bool _passwordVisible = false;

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
            widget.labelText,
            style: h7(context: context, fontWeight: '600'),
          ),
        ),
        TextField(
            controller: widget.controller,
            cursorColor: goGreen,
            focusNode: widget.focusNode,
            onSubmitted: (value) {
              widget.focusNode.unfocus();
              FocusScope.of(context).requestFocus(widget.focusNext);
            },
            onChanged: (value) {},
            style: h4(context: context, fontWeight: '600'),
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              fillColor: grey100,
              filled: true,
              contentPadding: const EdgeInsets.all(12),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: grayBlue,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              focusedBorder: createInputDecoration(context, color: goGreen),
              enabledBorder: createInputDecoration(context),
            )),
      ],
    );
  }
}
