import 'package:cmms/common/constant/export.dart';
import 'package:cmms/feature/home_dashboard/widget/working.dart';
import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter/material.dart';

class FloatingDraggable extends StatefulWidget {
  const FloatingDraggable({Key? key}) : super(key: key);

  @override
  State<FloatingDraggable> createState() => _FloatingDraggableState();
}

class _FloatingDraggableState extends State<FloatingDraggable> {
  @override
  Widget build(BuildContext context) {
    return FloatingDraggableWidget(
        floatingWidget: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Woking());
              },
            );
          },
          backgroundColor: dodgerBlue,
          child: const Icon(Icons.pause_circle_filled_outlined),
        ),
        floatingWidgetHeight: 60,
        floatingWidgetWidth: 60,
        dx: 200,
        dy: 300,
        mainScreenWidget: Text(''));
  }
}
