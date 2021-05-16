import 'package:flutter/material.dart';
import '../../google_ui.dart';

class GoogleSwitch extends StatelessWidget {
  const GoogleSwitch({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool value;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GoogleText(label),
        const Spacer(),
        Switch(value: value, onChanged: onChanged),
      ],
    );
  }
}
