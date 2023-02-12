import 'package:cmms/common/constant/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String languageCode = Localizations.localeOf(context).languageCode;
    String headerText = DateFormat('MM/yyyy', languageCode).format(focusedDay);
    return Row(
      children: [
        const SizedBox(width: 16.0),
        SizedBox(
          width: 120.0,
          child: Text(
            headerText,
            style: const TextStyle(fontSize: 26.0),
          ),
        ),
        if (clearButtonVisible)
          CupertinoButton(
            onPressed: onClearButtonTap,
            child: const Icon(CupertinoIcons.clear, size: 20.0),
          ),
        const Spacer(),
        CupertinoButton(
          onPressed: onLeftArrowTap,
          child: const Icon(CupertinoIcons.chevron_left),
        ),
        CupertinoButton(
          onPressed: onRightArrowTap,
          child: const Icon(CupertinoIcons.chevron_right),
        ),
      ],
    );
  }
}

BoxDecoration box = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
);
CalendarFormat _calendarFormat = CalendarFormat.month;

buildTableCalendar(
  context,
  calendarobject,
  getEventsfromDay,
  onDaySelected,
  onleftClick,
  onrightClick,
  state,
) {
  String languageCode = Localizations.localeOf(context).languageCode;
  print(languageCode);
  if (calendarobject == null) return Container();
  if (calendarobject['selectedDay'] == null) return Container();
  return Column(
    children: [
      // ValueListenableBuilder<DateTime>(
      //   valueListenable: calendarobject['selectedDay'],
      //   builder: (context, value, _) {
      //     return _CalendarHeader(
      //       focusedDay: value,
      //       clearButtonVisible: false,
      //       onTodayButtonTap: () {
      //         // setState(() => _focusedDay.value = DateTime.now());
      //       },
      //       onClearButtonTap: () {},
      //       onLeftArrowTap: () {
      //         onleftClick();
      //       },
      //       onRightArrowTap: () {
      //         onrightClick();
      //       },
      //     );
      //   },
      // ),
      TableCalendar(
        firstDay: DateTime.now(),
        lastDay: DateTime.now().add(const Duration(days: 1000)),
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
          CalendarFormat.week: 'Week',
        },
        calendarFormat: _calendarFormat,
        startingDayOfWeek: StartingDayOfWeek.monday,
        onFormatChanged: (format) {
          state(() {
            _calendarFormat = format;
          });
        },
        selectedDayPredicate: (day) =>
            isSameDay(day, calendarobject['selectedDay'].value),
        calendarBuilders: CalendarBuilders(
          singleMarkerBuilder: (context, date, _) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (date == calendarobject['selectedDay'] ||
                        date == calendarobject['start_Date_pick'] ||
                        date == calendarobject['end_Date_pick'])
                    ? grey100
                    : goGreen,
              ),
              width: 4,
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 1.5),
            );
          },
        ),
        locale: languageCode == 'vi' ? 'vi_VN' : 'en_EN',
        // headerVisible: false,
        focusedDay: calendarobject['selectedDay'].value,
        availableGestures: AvailableGestures.none,
        onDaySelected: (DateTime selectDay, DateTime focusDay) {
          calendarobject['selectedDay'].value = selectDay;
          onDaySelected(selectDay);
          state(() {});
        },
        eventLoader: getEventsfromDay,
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
            border: const Border.fromBorderSide(BorderSide(color: dodgerBlue)),
            borderRadius: BorderRadius.circular(8),
          ),
          todayTextStyle: h5(color: dodgerBlue, fontWeight: '700'),
          defaultTextStyle: h5(context: context),
          defaultDecoration: box,
          weekendDecoration: box,
          outsideDecoration: box,
          rangeStartDecoration: BoxDecoration(
            color: dodgerBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          rangeEndDecoration: BoxDecoration(
            color: dodgerBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          selectedTextStyle: h5(color: grey100, fontWeight: '700'),
          selectedDecoration: BoxDecoration(
            color: dodgerBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          disabledDecoration: box,
          withinRangeDecoration: box,
          rowDecoration: box,
        ),
        headerStyle: HeaderStyle(
          headerMargin: const EdgeInsets.all(8),
          titleTextStyle: h8(fontWeight: '700', color: grayBlue),
          leftChevronVisible: false,
          rightChevronVisible: false,
        ),
      ),
    ],
  );
}
