import 'package:date_format/date_format.dart' as dateFormat;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

import 'google_text.dart';

class GoogleCalendar extends HookWidget {
  const GoogleCalendar({
    Key? key,
    this.onDaySelected,
    this.padding = const EdgeInsets.all(8.0),
  }) : super(key: key);

  final Function(DateTime selectedDay, DateTime focusedDay)? onDaySelected;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final selectedDayState = useState(DateTime.now());
    final focusedDayState = useState(DateTime.now());

    return Padding(
      padding: padding,
      child: TableCalendar(
        headerStyle: HeaderStyle(
          leftChevronVisible: false,
          rightChevronVisible: false,
          headerPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: 24.0,
          ),
          titleTextStyle: TextStyle(
            fontSize: 16.0,
            color: colorScheme.primary,
          ),
        ),
        onDaySelected: (selectedDay, focusedDay) {
          if (onDaySelected != null) {
            onDaySelected!(selectedDay, focusedDay);
          }
          selectedDayState.value = selectedDay;
          focusedDayState.value = focusedDay;
        },
        selectedDayPredicate: (day) {
          return isSameDay(selectedDayState.value, day);
        },
        firstDay: DateTime.utc(DateTime.now().year - 5),
        lastDay: DateTime.utc(DateTime.now().year + 5),
        focusedDay: focusedDayState.value,
        calendarFormat: CalendarFormat.month,
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextFormatter: (date, locale) =>
              dateFormat.formatDate(date, [dateFormat.D]),
          weekdayStyle: TextStyle(color: colorScheme.onBackground),
          weekendStyle: TextStyle(color: colorScheme.onBackground),
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(color: colorScheme.onBackground),
          weekendTextStyle: TextStyle(color: colorScheme.onBackground),
          outsideTextStyle: TextStyle(
            color: colorScheme.onBackground.withOpacity(.5),
          ),
        ),
        calendarBuilders: CalendarBuilders(
          todayBuilder: (context, date, _) => _Today(date: date),
          selectedBuilder: (context, date, _) => _SelectedDay(date: date),
        ),
      ),
    );
  }
}

class _SelectedDay extends StatelessWidget {
  const _SelectedDay({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.primary),
        borderRadius: BorderRadius.circular(4.0),
      ),
      margin: const EdgeInsets.all(2.0),
      child: Center(
        child: GoogleText(
          "${date.day}",
          color: colorScheme.primary,
          variant: GoogleTextVariant.bodyText2,
        ),
      ),
    );
  }
}

class _Today extends StatelessWidget {
  const _Today({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.primary),
        borderRadius: BorderRadius.circular(4.0),
        color: colorScheme.primary,
      ),
      margin: const EdgeInsets.all(2.0),
      child: Center(
        child: GoogleText(
          "${date.day}",
          color: Colors.white,
          variant: GoogleTextVariant.bodyText2,
        ),
      ),
    );
  }
}
