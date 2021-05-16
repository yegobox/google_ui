import 'package:flutter/material.dart';

import '../../google_ui.dart';

class GoogleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GoogleAppBar({
    Key? key,
    this.title,
    this.subtitle,
    this.customTitle,
    this.centerTitle,
    this.backgroundColor,
    this.textColor,
    this.elevation,
    this.bottom,
    this.bottomOpacity = 1.0,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.toolbarHeight,
    this.leadingWidth,
    this.actions,
    this.flexibleSpace,
    this.shadowColor,
    this.shape,
    this.brightness,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final Widget? customTitle;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final PreferredSizeWidget? bottom;
  final double bottomOpacity;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final double? toolbarHeight;
  final double? leadingWidth;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      title: _createTitle(
        title: title,
        subtitle: subtitle,
        customTitle: customTitle,
        centerTitle: centerTitle,
        textColor: textColor,
      ),
      backgroundColor: backgroundColor ?? colorScheme.surface,
      centerTitle: centerTitle,
      elevation: elevation,
      bottom: bottom,
      bottomOpacity: bottomOpacity,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      actions: actions,
      flexibleSpace: flexibleSpace,
      shadowColor: shadowColor,
      shape: shape,
      brightness: brightness,
      iconTheme: IconThemeData(color: textColor ?? colorScheme.onSurface),
    );
  }

  Widget _createTitle({
    String? title,
    String? subtitle,
    Widget? customTitle,
    bool? centerTitle,
    Color? textColor,
  }) {
    return customTitle ??
        Column(
          crossAxisAlignment: centerTitle != null && centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            GoogleText(
              title ?? "",
              variant: GoogleTextVariant.headline6,
              color: textColor,
            ),
            if (subtitle != null)
              GoogleText(
                subtitle,
                variant: GoogleTextVariant.bodyText2,
                color: textColor,
              ),
          ],
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      toolbarHeight ?? kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
