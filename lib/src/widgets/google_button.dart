import 'package:flutter/material.dart';

import 'google_text.dart';

enum GoogleButtonVariant { primary, outlined, text }

class GoogleButton extends StatelessWidget {
  const GoogleButton(
    this.text, {
    Key? key,
    required this.onPressed,
    this.variant = GoogleButtonVariant.primary,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;
  final GoogleButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case GoogleButtonVariant.primary:
        return _PrimaryButton(onPressed: onPressed, text: text.toUpperCase());
      case GoogleButtonVariant.outlined:
        return _OutlinedButton(onPressed: onPressed, text: text.toUpperCase());
      case GoogleButtonVariant.text:
        return _TextButton(onPressed: onPressed, text: text.toUpperCase());

      default:
        return _PrimaryButton(onPressed: onPressed, text: text.toUpperCase());
    }
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextButton(
      onPressed: onPressed,
      child: GoogleText(
        text,
        variant: GoogleTextVariant.button,
        color: colorScheme.primary,
      ),
    );
  }
}

class _OutlinedButton extends StatelessWidget {
  const _OutlinedButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: GoogleText(
        text,
        variant: GoogleTextVariant.button,
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      child: GoogleText(
        text,
        variant: GoogleTextVariant.button,
        color: colorScheme.onPrimary,
      ),
    );
  }
}
