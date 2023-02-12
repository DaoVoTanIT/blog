import 'package:flutter/material.dart';
import 'package:cmms/common/constant/colors.dart';
import 'package:cmms/common/model/checklist/check_list.dart';
import 'package:cmms/feature/detail_task/detail_task_bloc/checklist/bloc/checklist.dart';

buildInforChecklist(BuildContext context, List<CheckListModel> listChecklist,
    ChecklistBloc checklistBloc) {
  return Column(
    children: [
      ...listChecklist.map(
        (e) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: e.db?.statusFinish,
              onChanged: (value) {
                if (checklistBloc.isClosed) return;
                checklistBloc.add(ChecklistsEvent(idChecklist: e.db!.id ?? ''));
              },
              activeColor: goGreen,
            ),
            Expanded(
              child: Text(
                e.db?.checklist ?? '',
                style: TextStyle(
                    decoration: e.db!.statusFinish!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 16,
                    height: 24 / 20,
                    fontFamily: 'Mulish',
                    color: e.db!.statusFinish ?? true ? grayBlue : grey1000),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
