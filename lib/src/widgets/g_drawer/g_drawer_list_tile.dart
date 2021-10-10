import 'package:flutter/material.dart';

import 'package:google_ui/google_ui.dart';

import '../g_text/g_text.dart';

class GDrawerListTile extends StatelessWidget {
  const GDrawerListTile({
    Key? key,
    this.leading,
    required this.title,
    this.trailing,
    this.borderRadius = const BorderRadius.horizontal(
      right: Radius.circular(30),
    ),
    this.contentPadding = const EdgeInsets.only(
      left: 16,
      right: 24,
    ),
    this.padding = const EdgeInsets.only(right: 8),
    this.selected = false,
    this.selectedColor,
    this.onTap,
  }) : super(key: key);

  final Widget? leading;
  final String title;
  final Widget? trailing;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  final bool selected;
  final Color? selectedColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final selectedColor = this.selectedColor ?? colorScheme.primary;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: ListTileTheme(
        contentPadding: contentPadding,
        selectedColor: selectedColor,
        selectedTileColor: selectedColor.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        dense: true,
        child: ListTile(
          leading: leading,
          title: GText(
            title,
            fontWeight: FontWeight.w500,
            color: selected ? selectedColor : null,
          ),
          trailing: trailing,
          selected: selected,
          onTap: onTap,
        ),
      ),
    );
  }
}
