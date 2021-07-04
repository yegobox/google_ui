import 'package:flutter/material.dart';

import 'index.dart';

/// Create switch.
class GoogleSwitch extends StatelessWidget {
  const GoogleSwitch({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  /// Text that describes the switch.
  final String label;

  /// Whether this switch is on or off.
  final bool value;

  /// A callback after the user toggles the switch.
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
