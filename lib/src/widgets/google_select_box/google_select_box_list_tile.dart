import 'package:flutter/material.dart';

class GoogleSelectBoxListTile extends StatelessWidget {
  const GoogleSelectBoxListTile({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.colorScheme,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final void Function() onTap;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing:
          isSelected ? Icon(Icons.check, color: colorScheme.primary) : null,
      onTap: () => onTap(),
    );
  }
}
