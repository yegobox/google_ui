import 'package:flutter/material.dart';

import '../models/index.dart';
import 'index.dart';

class GoogleSelectBox extends StatelessWidget {
  const GoogleSelectBox({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final dynamic value;
  final List<GoogleSelectBoxItem> items;
  final void Function(dynamic value) onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final List<Widget> children = [];

    for (int i = 0; i < items.length; i++) {
      children.add(_ListTile(
        value: value,
        item: items[i],
        onChanged: onChanged,
        colorScheme: colorScheme,
      ));

      if (i != items.length - 1) {
        children.add(const Divider(height: 0, indent: 16));
      }
    }

    return Column(children: children);
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    Key? key,
    required this.value,
    required this.item,
    required this.onChanged,
    required this.colorScheme,
  }) : super(key: key);

  final dynamic value;
  final GoogleSelectBoxItem item;
  final void Function(dynamic) onChanged;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GoogleText(item.label),
      trailing: value == item.value
          ? Icon(Icons.check, color: colorScheme.primary)
          : null,
      onTap: () => onChanged(item.value),
    );
  }
}
