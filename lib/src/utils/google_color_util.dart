import 'package:flutter/material.dart';

/// Utilities to manipulate color
class GoogleColorUtil {
  /// Return new darken color
  static Color darken(Color color, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    final f = 1 - percent / 100;
    return Color.fromARGB(color.alpha, (color.red * f).round(),
        (color.green * f).round(), (color.blue * f).round());
  }

  /// Return new lighten color
  static Color lighten(Color color, [int percent = 10]) {
    assert(1 <= percent && percent <= 100);
    final p = percent / 100;
    return Color.fromARGB(
        color.alpha,
        color.red + ((255 - color.red) * p).round(),
        color.green + ((255 - color.green) * p).round(),
        color.blue + ((255 - color.blue) * p).round());
  }
}
