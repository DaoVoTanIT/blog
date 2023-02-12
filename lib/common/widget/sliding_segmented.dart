import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/translations/export_lang.dart';

class SlidingSegmented extends StatefulWidget {
  const SlidingSegmented(
      {Key? key, this.title, this.tabs, required this.controlle, this.onTap})
      : super(key: key);
  final String? title;
  final List<String>? tabs;
  final TabController controlle;
  final Function(int)? onTap;

  @override
  State<SlidingSegmented> createState() => _SlidingSegmentedState();
}

class _SlidingSegmentedState extends State<SlidingSegmented>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = widget.controlle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  widget.title!,
                  style: h5(fontWeight: '700', context: context),
                ),
              ),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: color4.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: tiffanyBlue,
            ),
            controller: _controller,
            onTap: widget.onTap ?? (value) {},
            labelColor: grey100,
            unselectedLabelColor: grayBlue,
            labelStyle: h7(fontWeight: '600', color: grey100),
            unselectedLabelStyle: h7(fontWeight: '600', color: grayBlue),
            tabs: widget.tabs == null
                ? [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(LocaleKeys.all.tr()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(LocaleKeys.mle.tr()),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(LocaleKeys.femle.tr()),
                    ),
                  ]
                : List.generate(
                    widget.tabs!.length,
                    (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(widget.tabs![index]),
                        )),
          ),
        ),
      ],
    );
  }
}
