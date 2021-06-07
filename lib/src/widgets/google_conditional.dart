import 'package:flutter/material.dart';

class GoogleConditional extends StatelessWidget {
  const GoogleConditional({
    Key? key,
    required this.condition,
    required this.onTrue,
    required this.onFalse,
  }) : super(key: key);

  final bool condition;
  final Widget onTrue;
  final Widget onFalse;

  @override
  Widget build(BuildContext context) {
    if (condition) return onTrue;
    return onFalse;
  }

  static Widget? isTrue({required bool condition, required Widget onTrue}) =>
      condition ? onTrue : null;
}
