import 'package:flutter/material.dart';

class GoogleCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const GoogleCustomAppBar({
    Key? key,
    required this.title,
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

  final Widget title;
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
      title: title,
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

  @override
  Size get preferredSize => Size.fromHeight(
      toolbarHeight ?? kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
