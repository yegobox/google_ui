import 'package:flutter/material.dart';

class GoogleMenuItem {
  final Widget? icon;
  final String title;
  final String? subtitle;
  final Widget page;

  GoogleMenuItem({
    this.icon,
    required this.title,
    this.subtitle,
    required this.page,
  });
}
