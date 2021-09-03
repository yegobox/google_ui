import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import 'g_calendar_timeline_controller.dart';
import 'g_calendar_timeline_day.dart';
import 'g_calendar_timeline_page_view.dart';

/// Create a Calendar Timeline.
class GCalendarTimeline extends HookWidget {
  const GCalendarTimeline({
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

  /// [GCalendarTimeline] controller.
  final GCalendarTimelineController controller;

  /// Day builder for [GCalendarTimeline], default is [GCalendarTimelineDay].
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

  /// Empty space arround the [GCalendarTimeline].
  final EdgeInsets padding;

  /// A callback after the user selecting the day.
  /// not called if the selected day is changed using
  /// [GCalendarTimelineController].
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
            child: GCalendarTimelinePageView(
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
