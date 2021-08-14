import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.hideCounterText = true,
    this.maxLength,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
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

  /// A callback after editing completed.
  final void Function()? onEditingComplete;

  /// A callback after this field submitted.
  final void Function(String)? onFieldSubmitted;

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

  /// A widget to display after the input area.
  final Widget? suffixIcon;

  /// A widget to display before the input area.
  final Widget? prefixIcon;

  /// A callback after form [validate()] called.
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final isShowPassword = useState(false);

    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: passwordField && !isShowPassword.value,
      validator: validator,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      onTap: onTap,
      readOnly: readOnly,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        counterText: hideCounterText ? "" : null,
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: passwordField
            ? _TogglePasswordButton(isShowPassword: isShowPassword)
            : suffixIcon,
      ),
      style: Theme.of(context).textTheme.bodyText1,
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
