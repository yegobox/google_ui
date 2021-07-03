import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class GoogleTextFormField extends HookWidget {
  const GoogleTextFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.initialValue,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
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

  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool passwordField;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final bool readOnly;
  final bool hideCounterText;
  final int? maxLength;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final isShowPassword = useState(false);

    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: passwordField ? !isShowPassword.value : obscureText,
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
