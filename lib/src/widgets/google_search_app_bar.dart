import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'index.dart';

class GoogleSearchAppBar extends HookWidget implements PreferredSizeWidget {
  const GoogleSearchAppBar({
    Key? key,
    this.title,
    this.subtitle,
    this.centerTitle,
    required this.hintText,
    this.keyboardType,
    this.onFieldSubmitted,
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
  final bool? centerTitle;
  final String hintText;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
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

    final isSearch = useState(false);
    final focusNode = useState(FocusNode());
    final searchBarController = useState(TextEditingController());

    return AppBar(
      title: isSearch.value
          ? _createSearchBar(searchBarController.value, focusNode.value)
          : _createTitle(),
      backgroundColor: backgroundColor ?? colorScheme.surface,
      centerTitle: centerTitle,
      elevation: elevation,
      bottom: bottom,
      bottomOpacity: bottomOpacity,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      actions: [
        IconButton(
          icon: Icon(!isSearch.value ? Icons.search : Icons.close),
          onPressed: () => isSearch.value = !isSearch.value,
        ),
        if (!isSearch.value && actions != null) ...actions!
      ],
      flexibleSpace: flexibleSpace,
      shadowColor: shadowColor,
      shape: shape,
      brightness: brightness,
      iconTheme: IconThemeData(color: textColor ?? colorScheme.onSurface),
    );
  }

  Widget _createSearchBar(
    TextEditingController searchBarController,
    FocusNode focusNode,
  ) {
    return TextFormField(
      autofocus: true,
      keyboardType: keyboardType,
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

  Widget _createTitle() {
    return Column(
      crossAxisAlignment: centerTitle != null && centerTitle!
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
            subtitle!,
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
