import 'package:flutter/material.dart';

/// Create popup menu item.
class GooglePopupMenuItem {
  final void Function() onPressed;
  final Widget? icon;
  final String label;

  GooglePopupMenuItem({
    required this.onPressed,
    this.icon,
    required this.label,
  });
}
