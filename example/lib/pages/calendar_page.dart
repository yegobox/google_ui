import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:google_ui/google_ui.dart';

class CalendarPage extends HookWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final dateTimeNow = useState(DateTime.now());
    final selectedDay = useState(DateTime.now());

    final calendarController = useState(
      GCalendarTimelineController(
        today: dateTimeNow.value,
        startDate: DateTime(
          dateTimeNow.value.year - 1,
          dateTimeNow.value.month,
          dateTimeNow.value.day,
        ),
        endDate: DateTime(
          dateTimeNow.value.year + 1,
          dateTimeNow.value.month,
          dateTimeNow.value.day,
        ),
      ),
    );

    final customCalendarController = useState(
      GCalendarTimelineController(
        today: dateTimeNow.value,
        startDate: DateTime(
          dateTimeNow.value.year - 1,
          dateTimeNow.value.month,
          dateTimeNow.value.day,
        ),
        endDate: DateTime(
          dateTimeNow.value.year + 1,
          dateTimeNow.value.month,
          dateTimeNow.value.day,
        ),
      ),
    );

    DateTime lastWeek() {
      final dateTime = selectedDay.value;
      return dateTime.subtract(const Duration(days: 7));
    }

    DateTime nextWeek() {
      final dateTime = selectedDay.value;
      return dateTime.add(const Duration(days: 7));
    }

    return Scaffold(
      appBar: const GAppBar(title: "Calendar"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GCalendarTimeline(
              controller: calendarController.value,
              onDaySelected: (dateTime) => selectedDay.value = dateTime,
              dayBuilder: (dateTime, isToday, isSelected) {
                return GCalendarTimelineDay(
                  dateTime: dateTime,
                  isToday: isToday,
                  isSelected: isSelected,
                );
              },
            ),
            const Divider(height: 0),
            GSectionTitle(
              "Custom GCalendarTimeline",
              backgroundColor: colorScheme.onBackground.withOpacity(.05),
            ),
            GCalendarTimeline(
              controller: customCalendarController.value,
              onDaySelected: (dateTime) => selectedDay.value = dateTime,
              dayBuilder: (dateTime, isToday, isSelected) {
                return GCalendarTimelineDay(
                  dateTime: dateTime,
                  isToday: isToday,
                  isSelected: isSelected,
                  dayColor: Colors.green[50],
                  todayColor: Colors.green,
                  selectedTodayColor: Colors.green[50],
                  textColor: Colors.black,
                  todayTextColor: Colors.white,
                  selectedTodayTextColor: Colors.green,
                  selectedBorder: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(4),
                );
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GButton(
                    "Select previous day",
                    onPressed: () {
                      final newSelectedDay =
                          selectedDay.value.subtract(const Duration(days: 1));

                      calendarController.value.selectedDay = newSelectedDay;
                      selectedDay.value = newSelectedDay;
                    },
                  ),
                  GButton(
                    "Select next day",
                    onPressed: () {
                      final newSelectedDay =
                          selectedDay.value.add(const Duration(days: 1));

                      calendarController.value.selectedDay = newSelectedDay;
                      selectedDay.value = newSelectedDay;
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GButton(
                    "Jump to today",
                    onPressed: () => calendarController.value.jumpToIndex(
                      calendarController.value.todayIndex,
                    ),
                  ),
                  GButton(
                    "Jump to last week",
                    onPressed: () =>
                        calendarController.value.jumpToDateTime(lastWeek()),
                  ),
                  GButton(
                    "Jump to next week",
                    onPressed: () =>
                        calendarController.value.jumpToDateTime(nextWeek()),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GButton(
                    "Animate to today",
                    onPressed: () => calendarController.value.animateToIndex(
                      calendarController.value.todayIndex,
                    ),
                  ),
                  GButton(
                    "Animate to last week",
                    onPressed: () =>
                        calendarController.value.animateToDateTime(lastWeek()),
                  ),
                  GButton(
                    "Animate to next week",
                    onPressed: () =>
                        calendarController.value.animateToDateTime(nextWeek()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
