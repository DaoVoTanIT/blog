import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cmms/app/animation_click.dart';
import 'package:cmms/common/constant/generate_start_end_calendar.dart';
import 'package:cmms/common/route/routes.dart';
import 'package:cmms/common/widget/button/icon_button_cpn.dart';
import 'package:cmms/feature/home_dashboard/widget/to_to_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cmms/common/constant/export.dart';
import 'package:cmms/common/widget/app_bar.dart';
import 'package:cmms/feature/notification/notification_bloc/notification/bloc/notification.dart';
import 'package:cmms/translations/export_lang.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWorkOrderPage extends StatefulWidget {
  const CalendarWorkOrderPage({Key? key}) : super(key: key);

  @override
  State<CalendarWorkOrderPage> createState() => _CalendarWorkOrderPageState();
}

class _CalendarWorkOrderPageState extends State<CalendarWorkOrderPage>
    with TickerProviderStateMixin {
  bool darkMode = false;
  TextEditingController searchCtl = TextEditingController();
  FocusNode searchFn = FocusNode();
  late NotificationBloc notificationBloc;
  final FirebaseFirestore instance = FirebaseFirestore.instance;
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime.now();
  DateTime? time;
  Map<String, List> _events = {};
  late dynamic calendarObject;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;
  ValueNotifier<List<DateTime>>? _selectedEvents;
  BoxDecoration box = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
  );
  List<dynamic> _getEventsfromDay(DateTime date) {
    return _events['${date.year}${date.month}${date.day}'] ?? [];
  }

  onDaySelected(DateTime date) {
    (_events['${date.year}${date.month}${date.day}'] ?? []);
  }

  onleftClick() {
    calendarObject = generateStartEnd(
        calendarObject['start_Date_pick'].add(const Duration(days: -1)));
    setState(() {});
  }

  onrightClick() {
    calendarObject = generateStartEnd(
        calendarObject['end_Date_pick'].add(const Duration(days: 1)));
    setState(() {});
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;

  List<DateTime> daysInRange(DateTime first, DateTime last) {
    final dayCount = last.difference(first).inDays + 1;
    return List.generate(
      dayCount,
      (index) => DateTime.utc(first.year, first.month, first.day + index),
    );
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents?.value = daysInRange(start, end);
    } else if (start != null) {
      _selectedEvents?.value = [start];
    } else if (end != null) {
      _selectedEvents?.value = [end];
    }
  }

  @override
  void dispose() {
    searchCtl.dispose();
    searchFn.dispose();
    super.dispose();
  }

  @override
  void initState() {
    notificationBloc = BlocProvider.of<NotificationBloc>(context);
    notificationBloc.add(GetNotificationEvent());
    calendarObject = generateStartEnd(DateTime.now());

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCpn(
        center: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 14,
          ),
          child: Text(
            'Work order',
            style: h1(color: black, fontWeight: '700'),
          ),
        ),
        right: GestureDetector(
          onTap: () {},
          child: const IconButtonCpn(
            path: icCalendar,
            iconColor: grayBlue,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: grey100,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TableCalendar(
                rangeSelectionMode: _rangeSelectionMode,
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Tháng',
                  CalendarFormat.week: 'Tuần',
                },
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                calendarBuilders: CalendarBuilders(
                  singleMarkerBuilder: (context, date, _) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (date == _selectedDay ||
                                date == _rangeStart ||
                                date == _rangeEnd)
                            ? grey100
                            : goGreen,
                      ),
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 1.5),
                    );
                  },
                ),
                //  eventLoader: getEvents,
                startingDayOfWeek: StartingDayOfWeek.monday,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(_selectedDay, selectedDay)) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                      _rangeStart = null;
                      _rangeEnd = null;
                      _rangeSelectionMode = RangeSelectionMode.toggledOff;
                    });
                  }
                },
                onRangeSelected: _onRangeSelected,
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                rowHeight: 56,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    border: const Border.fromBorderSide(
                        BorderSide(color: dodgerBlue)),
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
                firstDay:
                    DateTime(DateTime.now().year, DateTime.now().month - 11, 1),
                lastDay:
                    DateTime(DateTime.now().year, DateTime.now().month + 13, 0),
                focusedDay: _focusedDay,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  DateFormat('EEEE')
                      .format(_rangeStart ?? _selectedDay ?? DateTime.now())
                      .toUpperCase(),
                  style: h7(color: black, fontWeight: '700'),
                ),
              ),
              Expanded(
                child: AnimationClick(
                  function: () {
                    Navigator.of(context).pushNamed(
                      Routes.detailWorkOrder,
                    );
                  },
                  child: ToDoList(
                    device: 'Máy cắt thuỷ lực 150 tấn - Kiểm tra đầu giờ',
                    code: '#WO1122/2022',
                    level: 'High',
                    requestedBy: 'Requested by Thanh Le',
                    time: DateTime.now(),
                    status: 'In Progress',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
