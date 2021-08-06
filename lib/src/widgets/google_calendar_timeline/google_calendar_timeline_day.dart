import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoogleCalendarTimelineDay extends StatelessWidget {
  const GoogleCalendarTimelineDay({
    Key? key,
    required this.dateTime,
    required this.isToday,
    required this.isSelected,
    this.dayColor,
    this.todayColor,
    this.selectedTodayColor,
    this.textColor,
    this.todayTextColor,
    this.selectedTodayTextColor,
    this.selectedBorder,
    this.borderRadius,
  }) : super(key: key);

  final DateTime dateTime;
  final bool isToday;
  final bool isSelected;
  final Color? dayColor;
  final Color? todayColor;
  final Color? selectedTodayColor;
  final Color? textColor;
  final Color? todayTextColor;
  final Color? selectedTodayTextColor;
  final BoxBorder? selectedBorder;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final _dayColor = dayColor ?? colorScheme.onBackground.withOpacity(.05);
    final _todayColor = todayColor ?? colorScheme.primary;
    final _selectedtodayColor =
        selectedTodayColor ?? colorScheme.primary.withOpacity(.15);
    final _textColor = textColor ?? colorScheme.primary;
    final _todayTextColor = todayTextColor ?? colorScheme.onPrimary;
    final _selectedTodayTextColor =
        selectedTodayTextColor ?? colorScheme.primary;
    final _selectedBorder =
        selectedBorder ?? Border.all(color: colorScheme.primary, width: 2);
    final _borderRadius = borderRadius ?? BorderRadius.circular(8);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isToday
              ? isSelected
                  ? _selectedtodayColor
                  : _todayColor
              : _dayColor,
          borderRadius: _borderRadius,
          border: isSelected ? _selectedBorder : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat("MMM").format(dateTime),
              style: TextStyle(
                fontSize: 10,
                color: isToday
                    ? isSelected
                        ? _selectedTodayTextColor
                        : _todayTextColor
                    : _textColor,
              ),
            ),
            Text(
              dateTime.day.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isToday
                    ? isSelected
                        ? _selectedTodayTextColor
                        : _todayTextColor
                    : _textColor,
              ),
            ),
            Text(
              DateFormat("EEE").format(dateTime),
              style: TextStyle(
                fontSize: 10,
                color: isToday
                    ? isSelected
                        ? _selectedTodayTextColor
                        : _todayTextColor
                    : _textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
