import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoogleCalendarTimelineDay extends StatelessWidget {
  const GoogleCalendarTimelineDay({
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
            : Colors.grey.withOpacity(.15),
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
