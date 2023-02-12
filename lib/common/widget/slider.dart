// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/constant/styles.dart';
import 'package:cmms/common/util/number_format.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SliderCpn extends StatefulWidget {
  const SliderCpn({Key? key, this.min = 0, this.max = 100, required this.title})
      : super(key: key);
  final double min;
  final double max;
  final String title;

  @override
  State<SliderCpn> createState() => _SliderCpnState();
}

class _SliderCpnState extends State<SliderCpn> {
  late SfRangeValues currentValues = SfRangeValues(widget.min, widget.max);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            widget.title,
            style: h3(fontWeight: '700', context: context),
          ),
        ),
        SfRangeSliderTheme(
          data: SfRangeSliderThemeData(
              thumbColor: grey100,
              thumbRadius: 20,
              thumbStrokeWidth: 1,
              tickSize: const Size(1, 8),
              activeLabelStyle: h8(color: grayBlue),
              inactiveLabelStyle: h8(color: grayBlue),
              thumbStrokeColor: border),
          child: SfRangeSlider(
            min: widget.min,
            max: widget.max,
            interval: widget.max / 4,
            showTicks: true,
            numberFormat: numberFormat,
            startThumbIcon: DecoratedBox(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: color4.withOpacity(0.1),
                      offset: const Offset(0, 10),
                      blurRadius: 20)
                ], borderRadius: BorderRadius.circular(40), color: grey100),
                child: Center(
                  child: Text(
                    numberFormat.format(currentValues.start),
                    style: h8(context: context),
                  ),
                )),
            endThumbIcon: DecoratedBox(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: color4.withOpacity(0.1),
                      offset: const Offset(0, 10),
                      blurRadius: 20)
                ], borderRadius: BorderRadius.circular(40), color: grey100),
                child: Center(
                  child: Text(
                    numberFormat.format(currentValues.end),
                    style: h8(context: context),
                  ),
                )),
            showLabels: true,
            showDividers: true,
            inactiveColor: border,
            activeColor: tiffanyBlue,
            onChanged: (SfRangeValues value) {
              setState(() {
                currentValues = value;
              });
            },
            values: currentValues,
          ),
        )
      ],
    );
  }
}
