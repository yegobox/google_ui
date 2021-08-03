import 'package:flutter/material.dart';

/// [GoogleCalendarTimeline] controller.
class GoogleCalendarTimelineController extends ChangeNotifier {
  GoogleCalendarTimelineController({
    this.dayInRow = 5,
    required DateTime today,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    this.today = DateTime(today.year, today.month, today.day);
    this.startDate = DateTime(startDate.year, startDate.month, startDate.day);
    this.endDate = DateTime(endDate.year, endDate.month, endDate.day);
  }

  /// [PageController].
  final pageController = PageController();

  /// Number of days to be displayed in one row
  final int dayInRow;

  /// Current [DateTime].
  late final DateTime today;

  /// Start [DateTime].
  late final DateTime startDate;

  /// End [DateTime].
  late final DateTime endDate;

  /// Get number of days from [startDate] and [endDate].
  int get dateTimeLength => endDate.difference(startDate).inDays;

  /// Get [now] [dateIndex].
  int get todayIndex => today.difference(startDate).inDays;

  /// Get [now] [datePageViewIndex].
  int get todayPageViewIndex =>
      (today.difference(startDate).inDays / dayInRow).floor();

  /// Get [dateIndex].
  int getDateTimeIndex(DateTime dateTime) {
    return dateTime.difference(startDate).inDays;
  }

  /// Find page index using [DateTime] and Changes which page is displayed in
  /// the controlled [PageView].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToDateTime(DateTime dateTime) {
    final index = getDateTimeIndex(dateTime);
    pageController.jumpToPage((index / dayInRow).floor());
  }

  /// Find page index using [DateTime] and animates the controlled [PageView]
  /// from the current page to the given page.
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void animateToDateTime(
    DateTime dateTime, {
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = standardEasing,
  }) {
    final index = getDateTimeIndex(dateTime);
    final pageIndex = (index / dayInRow).floor();
    pageController.animateToPage(pageIndex, duration: duration, curve: curve);
  }

  /// Find page index using [dateIndex] and Changes which page is displayed in
  /// the controlled [PageView].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToIndex(int index) {
    pageController.jumpToPage((index / dayInRow).floor());
  }

  /// Find page index using [dateIndex] and animates the controlled [PageView]
  /// from the current page to the given page.
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void animateToIndex(
    int index, {
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = standardEasing,
  }) {
    final pageIndex = (index / dayInRow).floor();
    pageController.animateToPage(pageIndex, duration: duration, curve: curve);
  }

  /// Changes which page is displayed in the controlled [PageView].
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void jumpToPage(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }

  /// Animates the controlled [PageView] from the current page to the given page.
  ///
  /// Jumps the page position from its current value to the given value,
  /// without animation, and without checking if the new value is in range.
  void animateToPage(
    int pageIndex, {
    Duration duration = const Duration(milliseconds: 200),
    Curve curve = standardEasing,
  }) {
    pageController.animateToPage(pageIndex, duration: duration, curve: curve);
  }
}
