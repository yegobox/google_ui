import 'package:flutter/material.dart';

enum GoogleButtonVariant { elevated, outlined, text }

class GoogleButton extends StatelessWidget {
  const GoogleButton(
    this.label, {
    Key? key,
    required this.onPressed,
    this.variant = GoogleButtonVariant.elevated,
    this.icon,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final GoogleButtonVariant variant;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case GoogleButtonVariant.elevated:
        return _ElevatedButton(
          onPressed: onPressed,
          label: label,
          icon: icon,
        );
      case GoogleButtonVariant.outlined:
        return _OutlinedButton(
          onPressed: onPressed,
          label: label,
          icon: icon,
        );
      case GoogleButtonVariant.text:
        return _TextButton(
          onPressed: onPressed,
          label: label,
          icon: icon,
        );
    }
  }
}

class _TextButton extends StatelessWidget {
  const _TextButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? TextButton(
            onPressed: onPressed,
            child: Text(label),
          )
        : TextButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: Text(label),
          );
  }
}

class _OutlinedButton extends StatelessWidget {
  const _OutlinedButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? OutlinedButton(
            onPressed: onPressed,
            child: Text(label),
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: Text(label),
          );
  }
}

class _ElevatedButton extends StatelessWidget {
  const _ElevatedButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? ElevatedButton(
            onPressed: onPressed,
            child: Text(label),
          )
        : ElevatedButton.icon(
            onPressed: onPressed,
            icon: icon!,
            label: Text(label),
          );
  }
}
