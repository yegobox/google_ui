import 'package:flutter/material.dart';

enum GoogleListItemState {
  insert,
  update,
  delete,
}

class GoogleListItem {
  final String id;
  final Widget? icon;
  final String title;
  final String? subtitle;
  final Widget? page;
  final GoogleListItemState? state;

  GoogleListItem({
    required this.id,
    this.icon,
    required this.title,
    this.subtitle,
    this.page,
    this.state,
  });

  GoogleListItem copyWith({
    String? id,
    Widget? icon,
    String? title,
    String? subtitle,
    Widget? page,
    GoogleListItemState? state,
  }) {
    return GoogleListItem(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      page: page ?? this.page,
      state: state,
    );
  }
}
