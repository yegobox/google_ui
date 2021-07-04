import 'package:flutter/material.dart';

import 'index.dart';

/// Create a select box item.
class GoogleSelectBoxItem {
  final String label;
  final dynamic value;

  GoogleSelectBoxItem({
    required this.label,
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

/// Create a select box.
class GoogleSelectBox extends StatelessWidget {
  const GoogleSelectBox({
    Key? key,
    required this.value,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  /// Mark item if [item.value] is equal to [value].
  final dynamic value;

  /// A list [GoogleSelectBoxItem] to display as option to select.
  final List<GoogleSelectBoxItem> items;

  /// A callback after user select an option.
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
