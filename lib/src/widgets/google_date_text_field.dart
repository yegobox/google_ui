import 'package:date_format/date_format.dart' as dateFormat;
import 'package:flutter/material.dart';

import 'google_text_form_field.dart';

class GoogleDateTextFormField extends StatelessWidget {
  const GoogleDateTextFormField({
    Key? key,
    this.labelText,
    this.initialValue,
    this.controller,
    this.onSaved,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
  }) : super(key: key);

  final String? labelText;
  final DateTime? initialValue;
  final TextEditingController? controller;
  final void Function(DateTime? value)? onSaved;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? value, bool isValid)? validator;

  @override
  Widget build(BuildContext context) {
    final dateDefaultValue = initialValue != null
        ? dateFormat.formatDate(initialValue!, [
            dateFormat.dd,
            '/',
            dateFormat.mm,
            '/',
            dateFormat.yyyy,
          ])
        : null;

    const datePattern = r"^(0[1-9]|[12]\d|30|31)\/(0[1-9]|1[0-2])\/(\d{4})$";

    return GoogleTextFormField(
      labelText: labelText,
      hintText: "DD/MM/YYYY",
      initialValue: dateDefaultValue,
      keyboardType: TextInputType.datetime,
      onSaved: (value) {
        if (value != null) {
          onSavedCallback(datePattern, value);
        }
      },
      validator: (value) {
        bool isValid = false;
        if (value != null) isValid = RegExp(datePattern).hasMatch(value);
        if (validator != null) return validator!(value, isValid);
      },
    );
  }

  void onSavedCallback(String datePattern, String value) {
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
