import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

/// Create a Calendar Timeline.
class GoogleCalendarTimeline extends HookWidget {
  const GoogleCalendarTimeline({
    Key? key,
    required this.controller,
    this.yearText,
    this.yearTextGap = 16,
    this.gap = 4,
    this.height = 80,
    this.padding = const EdgeInsets.all(16),
    this.dayInRow = 5,
    this.startDate,
    this.endDate,
    this.onDaySelected,
    this.onPageChanged,
  }) : super(key: key);

  /// [PageView] controller.
  final PageController controller;

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

  /// Day count in one row.
  final int dayInRow;

  /// Set start date.
  final DateTime? startDate;

  /// Set end date.
  final DateTime? endDate;

  /// A callback after the user selecting the day.
  final void Function(DateTime value)? onDaySelected;

  /// A callback after page changed.
  final void Function(int index)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    final pageIndex = useState(0);
    final dateTimes = useState<List<DateTime>>([]);

    final now = useState(DateTime.now());
    final selectedDay = useState(now.value);

    final start = startDate ??
        DateTime(
          now.value.year - 3,
          now.value.month,
          now.value.day,
        );
    final end = endDate ??
        DateTime(
          now.value.year + 3,
          now.value.month,
          now.value.day,
        );

    void generateDates() {
      dateTimes.value.clear();

      final daysToGenerate = end.difference(start).inDays;
      dateTimes.value.addAll(
        List.generate(
          daysToGenerate,
          (i) => DateTime(start.year, start.month, start.day + i),
        ),
      );
    }

    useEffect(() {
      generateDates();

      final totalRow = (dateTimes.value.length / dayInRow).floor();
      if (pageIndex.value > totalRow) {
        pageIndex.value = totalRow;

        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (controller.hasClients) {
            controller.animateToPage(
              pageIndex.value,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeIn,
            );
          }
        });
      }
    }, [startDate, endDate]);

    useEffect(() {
      final dateTimeIndex = dateTimes.value.indexWhere(
        (e) => e == DateTime(now.value.year, now.value.month, now.value.day),
      );
      pageIndex.value = (dateTimeIndex / dayInRow).floor();

      WidgetsBinding.instance?.addPostFrameCallback((_) {
        if (controller.hasClients) {
          controller.jumpToPage(pageIndex.value);
        }
      });
    }, []);

    final firstDateTimeInRow = dateTimes.value[pageIndex.value * dayInRow];

    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        padding.top,
        0,
        padding.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              padding.left,
              0,
              padding.right,
              0,
            ),
            child: yearText != null
                ? yearText!(firstDateTimeInRow)
                : Text(
                    DateFormat("MMM y").format(firstDateTimeInRow),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
          SizedBox(height: yearTextGap),
          SizedBox(
            height: height,
            child: _DateTimePageView(
              controller: controller,
              dateTimes: dateTimes,
              dayInRow: dayInRow,
              now: now,
              selectedDay: selectedDay,
              onDaySelected: onDaySelected,
              gap: gap,
              padding: padding,
              pageIndex: pageIndex,
              onPageChanged: onPageChanged,
            ),
          ),
        ],
      ),
    );
  }
}

class _DateTimePageView extends StatelessWidget {
  const _DateTimePageView({
    Key? key,
    required this.controller,
    required this.dateTimes,
    required this.dayInRow,
    required this.now,
    required this.selectedDay,
    required this.onDaySelected,
    required this.gap,
    required this.padding,
    required this.pageIndex,
    required this.onPageChanged,
  }) : super(key: key);

  final PageController controller;
  final ValueNotifier<List<DateTime>> dateTimes;
  final int dayInRow;
  final ValueNotifier<DateTime> now;
  final ValueNotifier<DateTime> selectedDay;
  final void Function(DateTime value)? onDaySelected;
  final double gap;
  final EdgeInsets padding;
  final ValueNotifier<int> pageIndex;
  final void Function(int index)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: (dateTimes.value.length / dayInRow).ceil(),
      itemBuilder: (context, index) {
        final children = <Widget>[];
        for (int i = 0; i < dayInRow; i++) {
          final dateTimeIndex = index * dayInRow + i;
          if (dateTimeIndex > dateTimes.value.length - 1) {
            children.add(Expanded(child: Container()));
            continue;
          }

          final dateTime = dateTimes.value[dateTimeIndex];
          final dateNow = DateTime(
            now.value.year,
            now.value.month,
            now.value.day,
          );
          final selectedDate = DateTime(
            selectedDay.value.year,
            selectedDay.value.month,
            selectedDay.value.day,
          );

          children.add(
            Expanded(
              child: GestureDetector(
                onTap: () {
                  selectedDay.value = dateTime;
                  if (onDaySelected != null) {
                    onDaySelected!(dateTime);
                  }
                },
                child: _GoogleCalendarTimelineDay(
                  dateTime: dateTimes.value[dateTimeIndex],
                  isToday: dateNow == dateTime,
                  isSelected: selectedDate == dateTime,
                ),
              ),
            ),
          );

          if (i != dayInRow - 1) {
            children.add(SizedBox(width: gap));
          }
        }

        return Padding(
          padding: EdgeInsets.fromLTRB(
            padding.left,
            0,
            padding.right,
            0,
          ),
          child: Row(children: children),
        );
      },
      onPageChanged: (index) {
        pageIndex.value = index;
        if (onPageChanged != null) {
          onPageChanged!(index);
        }
      },
    );
  }
}

class _GoogleCalendarTimelineDay extends StatelessWidget {
  const _GoogleCalendarTimelineDay({
    Key? key,
    required this.dateTime,
    required this.isToday,
    required this.isSelected,
  }) : super(key: key);

  final DateTime dateTime;
  final bool isToday;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isToday
            ? isSelected
                ? colorScheme.primary.withOpacity(.15)
                : colorScheme.primary
            : Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(
                color: colorScheme.primary,
                width: 2,
              )
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat("MMM").format(dateTime),
            style: TextStyle(
              fontSize: 10,
              color: isToday && !isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.primary,
            ),
          ),
          Text(
            dateTime.day.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isToday && !isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.primary,
            ),
          ),
          Text(
            DateFormat("EEE").format(dateTime),
            style: TextStyle(
              fontSize: 10,
              color: isToday && !isSelected
                  ? colorScheme.onPrimary
                  : colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
