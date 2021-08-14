import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../g_text/g_text.dart';

/// Create app bar with search bar.
class GSearchAppBar extends HookWidget implements PreferredSizeWidget {
  const GSearchAppBar({
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
    required this.hintText,
    this.keyboardType,
    required this.onFieldSubmitted,
    required this.onClosePressed,
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

  /// Set [GAppBar] background color.
  final Color? backgroundColor;

  /// The color to use for [GAppBar] icons.
  final Color? iconColor;

  /// Size of the shadow below app bar.
  final double? elevation;

  /// A widget to display before the [GAppBar]'s [title].
  final Widget? leading;

  /// If true allow to imply the leading widget.
  final bool automaticallyImplyLeading;

  /// Defines the width of [leading] widget.
  final double? leadingWidth;

  /// A list of Widgets to display in a row after the [title].
  final List<Widget>? actions;

  /// Text that suggests what sort of input the field accepts.
  final String hintText;

  /// Set keyboard type.
  final TextInputType? keyboardType;

  /// A callback after this field submitted.
  final void Function(String)? onFieldSubmitted;

  /// A callback after the user press the close button.
  final void Function()? onClosePressed;

  /// Determines the brightness of the [SystemUiOverlayStyle]:
  /// for [Brightness.dark], [SystemUiOverlayStyle.light] is used
  /// and for [Brightness.light], [SystemUiOverlayStyle.dark] is used.
  final Brightness? brightness;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isSearch = useState(false);

    return AppBar(
      title: isSearch.value ? _createSearchBar() : _createTitle(colorScheme),
      backgroundColor: backgroundColor ?? colorScheme.surface,
      centerTitle: centerTitle,
      elevation: elevation,
      bottom: bottom,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leadingWidth: leadingWidth,
      actions: [
        IconButton(
          icon: Icon(!isSearch.value ? Icons.search : Icons.close),
          onPressed: () {
            if (isSearch.value && onClosePressed != null) onClosePressed!();
            isSearch.value = !isSearch.value;
          },
        ),
        if (!isSearch.value && actions != null) ...actions!
      ],
      brightness: brightness,
      iconTheme: IconThemeData(color: iconColor ?? colorScheme.onSurface),
    );
  }

  Widget _createSearchBar() {
    return TextFormField(
      autofocus: true,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hintText,
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }

  Widget _createTitle(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: centerTitle != null && centerTitle!
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        GText(
          title ?? "",
          variant: GTextVariant.headline6,
          color: iconColor ?? colorScheme.onSurface,
        ),
        if (subtitle != null)
          GText(
            subtitle!,
            variant: GTextVariant.bodyText2,
            color: iconColor ?? colorScheme.onSurface,
          ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
