import 'package:flutter/material.dart';
import '../google_text/google_text.dart';

/// Create a section title.
class GoogleSectionTitle extends StatelessWidget {
  const GoogleSectionTitle(
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

  /// Set [GoogleSectionTitle] background color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: padding,
      color: backgroundColor,
      width: double.infinity,
      child: GoogleText(
        title,
        variant: GoogleTextVariant.bodyText2,
        color: color ?? colorScheme.onBackground.withOpacity(.75),
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
