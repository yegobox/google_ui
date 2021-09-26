import 'package:flutter/cupertino.dart';

class GResponsive {
  static double smallBreakpoint = 640;
  static double mediumBreakpoint = 1008;

  static T on<T>(
    BuildContext context, {
    required T initial,
    T? small,
    T? medium,
    T? large,
  }) {
    final screenSize = MediaQuery.of(context).size.width;

    if (screenSize <= smallBreakpoint) return small ?? initial;
    if (screenSize <= mediumBreakpoint) return medium ?? initial;
    return large ?? initial;
  }

  static bool isSmall(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return screenSize <= smallBreakpoint;
  }

  static bool isMedium(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return screenSize > smallBreakpoint && screenSize <= mediumBreakpoint;
  }

  static bool isLarge(BuildContext context) {
    final screenSize = MediaQuery.of(context).size.width;
    return screenSize > mediumBreakpoint;
  }
}
