import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../g_text/g_text.dart';

/// Create app bar with search bar.
class GSearchAppBar extends HookWidget implements PreferredSizeWidget {
  const GSearchAppBar({
    Key? key,
    required this.title,
    this.subtitle,
    this.controller,
    this.centerTitle,
    this.bottom,
    this.elevation,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.leadingWidth,
    this.actions,
    required this.hintText,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.onClosePressed,
    this.onActionPressed,
    this.open,
  }) : super(key: key);

  /// Text to display as title.
  final String title;

  /// Text to display as a subtitle, below the title.
  final String? subtitle;

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// If true align the title to the center.
  final bool? centerTitle;

  /// This widget appears across the bottom of the app bar.
  final PreferredSizeWidget? bottom;

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

  /// A callback after this field value changed.
  final void Function(String)? onChanged;

  /// A callback after this field submitted.
  final void Function(String)? onFieldSubmitted;

  /// A callback after the user press the close button.
  @Deprecated("use onActionPressed instead.")
  final void Function()? onClosePressed;

  /// A callback after the user press the action button.
  final void Function()? onActionPressed;

  /// Whether the search bar open or not.
  final bool? open;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isOpen = useState(false);
    final textController = useState(controller ?? TextEditingController());

    return AppBar(
      title: (open ?? isOpen.value)
          ? _createSearchBar(textController.value)
          : _createTitle(colorScheme),
      centerTitle: centerTitle,
      elevation: elevation,
      bottom: bottom,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leadingWidth: leadingWidth,
      actions: [
        IconButton(
          icon: Icon((open ?? isOpen.value) ? Icons.close : Icons.search),
          onPressed: () {
            if (open == null) {
              if (!isOpen.value) {
                isOpen.value = true;
                return;
              }

              if (textController.value.text.isNotEmpty) {
                textController.value.clear();
                if (onChanged != null) onChanged!("");

                return;
              }

              isOpen.value = false;
            }

            if (onActionPressed != null || onClosePressed != null) {
              final callback = onActionPressed ?? onClosePressed!;
              callback();
            }
          },
        ),
      ],
    );
  }

  Widget _createSearchBar(TextEditingController textController) {
    return TextFormField(
      controller: textController,
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
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }

  Widget _createTitle(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: centerTitle != null && centerTitle!
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(title),
        if (subtitle != null) GText(subtitle!),
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}
