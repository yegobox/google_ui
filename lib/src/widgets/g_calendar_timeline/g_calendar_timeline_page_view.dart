import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'g_calendar_timeline_controller.dart';
import 'g_calendar_timeline_day.dart';

class GCalendarTimelinePageView extends HookWidget {
  const GCalendarTimelinePageView({
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
  final GCalendarTimelineController controller;
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
                    ? GCalendarTimelineDay(
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
