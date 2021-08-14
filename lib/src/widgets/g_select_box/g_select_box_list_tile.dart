import 'package:flutter/material.dart';

class GSelectBoxListTile extends StatelessWidget {
  const GSelectBoxListTile({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.colorScheme,
  }) : super(key: key);

  final String label;
  final Widget? icon;
  final bool isSelected;
  final void Function() onTap;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      leading: icon,
      trailing:
          isSelected ? Icon(Icons.check, color: colorScheme.primary) : null,
      onTap: () => onTap(),
    );
  }
}
