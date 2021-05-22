import 'package:flutter/material.dart';

import 'index.dart';

class GoogleSectionTitle extends StatelessWidget {
  const GoogleSectionTitle(
    this.title, {
    Key? key,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final EdgeInsets padding;
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
        color: colorScheme.onBackground.withOpacity(.75),
      ),
    );
  }
}
