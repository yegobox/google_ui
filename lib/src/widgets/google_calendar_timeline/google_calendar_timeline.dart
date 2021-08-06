import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import 'google_calendar_timeline_controller.dart';
import 'google_calendar_timeline_day.dart';

/// Create a Calendar Timeline.
class GoogleCalendarTimeline extends HookWidget {
  const GoogleCalendarTimeline({
    Key? key,
    required this.controller,
    this.dayBuilder,
    this.yearText,
    this.yearTextGap = 16,
    this.gap = 4,
    this.height = 80,
    this.padding = const EdgeInsets.all(16),
    this.onDaySelected,
    this.onPageChanged,
  }) : super(key: key);

  /// [GoogleCalendarTimeline] controller.
  final GoogleCalendarTimelineController controller;

  /// Day builder for [GoogleCalendarTimeline], default is [GoogleCalendarTimelineDay].
  final Widget Function(
    DateTime dateTime,
    bool isToday,
    bool isSelected,
  )? dayBuilder;

  /// Custom [yearText] widget.
  final Widget Function(DateTime value)? yearText;

  /// Gap between [yearText] and date time [PageView].
  final double yearTextGap;

  /// Gap between day in one row.
  final double gap;

  /// Set date time [PageView] height.
  final double height;

  /// Empty space arround the [GoogleCalendarTimeline].
  final EdgeInsets padding;

  /// A callback after the user selecting the day.
  /// not called if the selected day is changed using
  /// [GoogleCalendarTimelineController].
  final void Function(DateTime value)? onDaySelected;

  /// A callback after page changed.
  final void Function(int index)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    final dateTimes = useState<List<DateTime>>([]);
    final currentRowMonth = useState(DateTime.now());

    useEffect(() {
      final startDate = controller.startDate;
      final endDate = controller.endDate;
      final todayPageViewIndex = controller.todayPageViewIndex;
      final dayInRow = controller.dayInRow;

      dateTimes.value = [];

      final dateTimeLength = endDate.difference(startDate).inDays;
      dateTimes.value = List.generate(
        dateTimeLength,
        (i) => DateTime(
          startDate.year,
          startDate.month,
          startDate.day + i,
        ),
      );

      final newCurrentRowMonthValue =
          dateTimes.value[todayPageViewIndex * dayInRow + dayInRow];

      WidgetsBinding.instance?.addPostFrameCallback((_) {
        currentRowMonth.value = newCurrentRowMonthValue;
        controller.jumpToPage(todayPageViewIndex);
      });
    }, [controller]);

    return Padding(
      padding: EdgeInsets.fromLTRB(0, padding.top, 0, padding.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(padding.left, 0, padding.right, 0),
            child: yearText != null
                ? yearText!(currentRowMonth.value)
                : _YearText(currentRowMonth: currentRowMonth.value),
          ),
          SizedBox(height: yearTextGap),
          SizedBox(
            height: height,
            child: _GoogleCalendarTimelinePageView(
              gap: gap,
              padding: padding,
              dayBuilder: dayBuilder,
              controller: controller,
              dateTimes: dateTimes.value,
              onDaySelected: onDaySelected,
              onPageChanged: (index) {
                currentRowMonth.value = dateTimes.value[
                    index * controller.dayInRow + controller.dayInRow - 1];
                if (onPageChanged != null) {
                  onPageChanged!(index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _YearText extends StatelessWidget {
  const _YearText({
    Key? key,
    required this.currentRowMonth,
  }) : super(key: key);

  final DateTime currentRowMonth;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat("MMMM y").format(currentRowMonth),
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}

class _GoogleCalendarTimelinePageView extends HookWidget {
  const _GoogleCalendarTimelinePageView({
    Key? key,
    required this.gap,
    required this.padding,
    required this.dateTimes,
    required this.dayBuilder,
    required this.controller,
    required this.onDaySelected,
    required this.onPageChanged,
  }) : super(key: key);

  final double gap;
  final EdgeInsets padding;
  final List<DateTime> dateTimes;
  final Widget Function(
    DateTime dateTime,
    bool isToday,
    bool isSelected,
  )? dayBuilder;
  final GoogleCalendarTimelineController controller;
  final void Function(DateTime value)? onDaySelected;
  final void Function(int index)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    final selectedDay = useState(controller.selectedDay);

    useEffect(() {
      controller.addListener(() {
        selectedDay.value = controller.selectedDay;
      });
    }, []);

    void _onDaySelected(DateTime dateTime) {
      controller.selectedDay = dateTime;
      if (onDaySelected != null) {
        onDaySelected!(dateTime);
      }
    }

    return PageView.builder(
      controller: controller.pageController,
      itemCount: (controller.dateTimeLength / controller.dayInRow).ceil(),
      itemBuilder: (context, index) {
        final children = <Widget>[];
        for (int i = 0; i < controller.dayInRow; i++) {
          final dayInRow = controller.dayInRow;
          final dateTimeLength = controller.dateTimeLength;
          final now = controller.today;

          final dateTimeIndex = index * dayInRow + i;
          if (dateTimeIndex > dateTimeLength - 1) {
            children.add(Expanded(child: Container()));
            continue;
          }

          final dateTime = dateTimes[dateTimeIndex];
          final dateNow = DateTime(
            now.year,
            now.month,
            now.day,
          );
          final selectedDate = DateTime(
            selectedDay.value.year,
            selectedDay.value.month,
            selectedDay.value.day,
          );

          children.add(
            Expanded(
              child: GestureDetector(
                onTap: () => _onDaySelected(dateTime),
                child: dayBuilder == null
                    ? GoogleCalendarTimelineDay(
                        dateTime: dateTimes[dateTimeIndex],
                        isToday: dateNow == dateTime,
                        isSelected: selectedDate == dateTime,
                      )
                    : dayBuilder!(
                        dateTimes[dateTimeIndex],
                        dateNow == dateTime,
                        selectedDate == dateTime,
                      ),
              ),
            ),
          );

          if (i != controller.dayInRow - 1) {
            children.add(SizedBox(width: gap));
          }
        }

        return Padding(
          padding: EdgeInsets.fromLTRB(padding.left, 0, padding.right, 0),
          child: Row(children: children),
        );
      },
      onPageChanged: onPageChanged,
    );
  }
}
