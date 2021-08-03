import 'package:flutter/material.dart';

/// Create a select box item.
class GoogleSelectBoxItem<T> {
  final String label;
  final Widget? icon;
  final T value;

  GoogleSelectBoxItem({
    required this.label,
    this.icon,
    required this.value,
  });

  GoogleSelectBoxItem copyWith({
    String? label,
    dynamic value,
  }) {
    return GoogleSelectBoxItem(
      label: label ?? this.label,
      value: value ?? this.value,
    );
  }
}
