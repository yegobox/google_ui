import 'package:flutter/material.dart';

/// Create a select box item.
class GSelectBoxItem<T> {
  final String label;
  final Widget? icon;
  final T value;

  GSelectBoxItem({
    required this.label,
    this.icon,
    required this.value,
  });

  GSelectBoxItem copyWith({
    String? label,
    dynamic value,
  }) {
    return GSelectBoxItem(
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }
}
