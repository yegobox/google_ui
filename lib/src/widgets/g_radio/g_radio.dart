import 'package:flutter/material.dart';

import '../../../google_ui.dart';

/// Create radio list tile.
class GRadio<T> extends StatelessWidget {
  const GRadio({
    Key? key,
    required this.title,
    this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  /// Text that describes the switch.
  final String title;

  /// Additional content displayed below the title.
  final String? subtitle;

  /// Whether this switch is on or off.
  final T value;

  /// The currently selected value for this group of radio buttons.
  final T groupValue;

  /// A callback after the user toggles the switch.
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return RadioListTile<T>(
      title: GText(title),
      subtitle: subtitle != null
          ? GText(
              subtitle!,
              variant: GTextVariant.bodyText2,
              color: colorScheme.onBackground.withOpacity(.75),
            )
          : null,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
