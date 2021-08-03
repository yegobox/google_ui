import 'package:flutter/material.dart';
import '../google_text/google_text.dart';

/// Create an app bar.
class GoogleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GoogleAppBar({
    Key? key,
    required this.title,
    this.subtitle,
    this.centerTitle,
    this.bottom,
    this.backgroundColor,
    this.iconColor,
    this.elevation,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.leadingWidth,
    this.actions,
    this.brightness,
  }) : super(key: key);

  /// Text to display as title.
  final String? title;

  /// Text to display as a subtitle, below the title.
  final String? subtitle;

  /// If true align the title to the center.
  final bool? centerTitle;

  /// This widget appears across the bottom of the app bar.
  final PreferredSizeWidget? bottom;

  /// Set [GoogleAppBar] background color.
  final Color? backgroundColor;

  /// The color to use for [GoogleAppBar] icons.
  final Color? iconColor;

  /// Size of the shadow below app bar.
  final double? elevation;

  /// A widget to display before the [GoogleAppBar]'s [title].
  final Widget? leading;

  /// If true allow to imply the leading widget.
  final bool automaticallyImplyLeading;

  /// Defines the width of [leading] widget.
  final double? leadingWidth;

  /// A list of Widgets to display in a row after the [title].
  final List<Widget>? actions;

  /// Determines the brightness of the [SystemUiOverlayStyle]:
  /// for [Brightness.dark], [SystemUiOverlayStyle.light] is used
  /// and for [Brightness.light], [SystemUiOverlayStyle.dark] is used.
  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      title: _createTitle(colorScheme),
      bottom: bottom,
      backgroundColor: backgroundColor ?? colorScheme.surface,
      centerTitle: centerTitle,
      elevation: elevation,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leadingWidth: leadingWidth,
      actions: actions,
      brightness: brightness,
      iconTheme: IconThemeData(color: iconColor ?? colorScheme.onSurface),
    );
  }

  Widget _createTitle(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: centerTitle != null && centerTitle!
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        GoogleText(
          title ?? "",
          variant: GoogleTextVariant.headline6,
          color: iconColor ?? colorScheme.onSurface,
        ),
        if (subtitle != null)
          GoogleText(
            subtitle!,
            variant: GoogleTextVariant.bodyText2,
            color: iconColor ?? colorScheme.onSurface,
          ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
