import 'package:date_format/date_format.dart' as date_format;
import 'package:flutter/material.dart';

import 'index.dart';

class GoogleDateTextFormField extends StatelessWidget {
  const GoogleDateTextFormField({
    Key? key,
    this.labelText,
    this.initialValue,
    this.controller,
    this.textInputAction,
    this.onSaved,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
  }) : super(key: key);

  final String? labelText;
  final DateTime? initialValue;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final void Function(DateTime? value)? onSaved;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? value, bool isValid)? validator;

  @override
  Widget build(BuildContext context) {
    const datePattern = r"^(0[1-9]|[12]\d|30|31)\/(0[1-9]|1[0-2])\/(\d{4})$";
    final dateDefaultValue = initialValue != null
        ? date_format.formatDate(initialValue!, [
            date_format.dd,
            '/',
            date_format.mm,
            '/',
            date_format.yyyy,
          ])
        : null;

    return GoogleTextFormField(
      labelText: labelText,
      hintText: "DD/MM/YYYY",
      initialValue: dateDefaultValue,
      keyboardType: TextInputType.datetime,
      textInputAction: textInputAction,
      onSaved: (value) {
        if (value != null) _onSaved(datePattern, value);
      },
      readOnly: readOnly,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      validator: (value) {
        bool isValid = true;
        if (!(value == null || value.trim() == '')) {
          isValid = RegExp(datePattern).hasMatch(value);
        }
        if (validator != null) return validator!(value, isValid);
      },
    );
  }

  void _onSaved(String datePattern, String value) {
    DateTime? date;
    final isValid = RegExp(datePattern).hasMatch(value);
    if (isValid) {
      final splitValue = value.split('/');
      final newValue = '${splitValue[2]}${splitValue[1]}${splitValue[0]}';

      date = DateTime.parse(newValue);
    }

    if (onSaved != null) onSaved!(date);
  }
}
