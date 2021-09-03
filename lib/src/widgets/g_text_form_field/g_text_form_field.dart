import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../g_text_selection_controls.dart';

/// Create text form field
class GTextFormField extends HookWidget {
  const GTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.passwordField = false,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.hideCounterText = true,
    this.maxLength,
    this.maxLines = 1,
    this.autocorrect = true,
    this.autofocus = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.inputFormatters,
    this.primaryColor,
    this.primaryColorBuilder,
    this.textColor,
    this.textColorBuilder,
    this.cursorColor,
    this.cursorColorBuilder,
  }) : super(key: key);

  /// Text that describes the input field.
  final String? labelText;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// The initial value of [GTextFormField].
  final String? initialValue;

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Set keyboard type.
  final TextInputType? keyboardType;

  /// An action the user has requested the text input control to perform.
  final TextInputAction? textInputAction;

  /// If true, make this field to password field.
  final bool passwordField;

  /// A callback after this field value changed.
  final void Function(String)? onChanged;

  /// A callback after form [save()] called.
  final void Function(String?)? onSaved;

  /// A callback after the user tap this widget.
  final void Function()? onTap;

  /// If true, set this field as read only.
  final bool readOnly;

  /// if true, hide counter text.
  final bool hideCounterText;

  /// Set max length.
  final int? maxLength;

  /// Set max lines.
  final int? maxLines;

  /// Enable or disable auto correct.
  final bool autocorrect;

  /// Enable or disable auto focus.
  final bool autofocus;

  /// A widget to display after the input area.
  final Widget? suffixIcon;

  /// A widget to display before the input area.
  final Widget? prefixIcon;

  /// A callback after form [validate()] called.
  final String? Function(String?)? validator;

  /// Input formatter.
  final List<TextInputFormatter>? inputFormatters;

  /// Set primary color.
  final Color? primaryColor;

  /// Set primary color using colorBuilder
  final Color? Function(ColorScheme)? primaryColorBuilder;

  /// Set [hintText] and [Text] color.
  final Color? textColor;

  /// Set text color using colorBuilder
  final Color? Function(ColorScheme)? textColorBuilder;

  /// The default color for [cursorColor], [selectionHandleColor] and [selectionColor].
  /// Note [selectionHandleColor] only changed on first build.
  final Color? cursorColor;

  /// Set cursor color using colorBuilder
  final Color? Function(ColorScheme)? cursorColorBuilder;

  @override
  Widget build(BuildContext context) {
    final isShowPassword = useState(false);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final _primaryColor =
        primaryColor ?? primaryColorBuilder?.call(colorScheme);
    final _textColor = textColor ?? textColorBuilder?.call(colorScheme);
    final _cursorColor = cursorColor ??
        cursorColorBuilder?.call(colorScheme) ??
        colorScheme.primary;

    return Theme(
      data: theme.copyWith(
        colorScheme: colorScheme.copyWith(primary: _primaryColor),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: _cursorColor,
          selectionHandleColor: _cursorColor,
          selectionColor: _cursorColor.withOpacity(.40),
        ),
      ),
      child: TextFormField(
        controller: controller,
        autocorrect: autocorrect,
        autofocus: autofocus,
        initialValue: initialValue,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: passwordField && !isShowPassword.value,
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        onTap: onTap,
        readOnly: readOnly,
        maxLength: maxLength,
        maxLines: maxLines,
        selectionControls: GTextSelectionControls(_cursorColor),
        decoration: InputDecoration(
          counterText: hideCounterText ? "" : null,
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: passwordField
              ? _TogglePasswordButton(isShowPassword: isShowPassword)
              : suffixIcon,
          hintStyle: theme.textTheme.bodyText1?.copyWith(
            color: _textColor?.withOpacity(.5),
            decorationColor: _textColor?.withOpacity(.5),
          ),
        ),
        style: theme.textTheme.bodyText1?.copyWith(
          color: _textColor,
          decorationColor: _textColor,
        ),
        inputFormatters: inputFormatters,
      ),
    );
  }
}

class _TogglePasswordButton extends StatelessWidget {
  const _TogglePasswordButton({Key? key, required this.isShowPassword})
      : super(key: key);

  final ValueNotifier<bool> isShowPassword;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          Icon(isShowPassword.value ? Icons.visibility : Icons.visibility_off),
      onPressed: () {
        isShowPassword.value = !isShowPassword.value;
      },
    );
  }
}
