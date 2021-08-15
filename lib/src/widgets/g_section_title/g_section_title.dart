import 'package:flutter/material.dart';

import '../g_text/g_text.dart';

/// Create a section title.
class GSectionTitle extends StatelessWidget {
  const GSectionTitle(
    this.title, {
    Key? key,
    this.padding = const EdgeInsets.all(16),
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  /// Text that describes the section.
  final String title;

  /// An empty space.
  final EdgeInsets padding;

  /// Set [title] text color.
  final Color? color;

  /// Set [GSectionTitle] background color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: padding,
      color: backgroundColor,
      width: double.infinity,
      child: GText(
        title,
        variant: GTextVariant.bodyText2,
        color: color ?? colorScheme.primary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
