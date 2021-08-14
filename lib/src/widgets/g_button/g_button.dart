import 'package:flutter/material.dart';

/// Variant for [GButton].
enum GButtonVariant { elevated, outlined, text }

/// Create a button.
class GButton extends StatelessWidget {
  const GButton(
    this.label, {
    Key? key,
    required this.onPressed,
    this.variant = GButtonVariant.elevated,
    this.icon,
  }) : super(key: key);

  /// Text that describes the button.
  final String label;

  /// A callback after the user click the button.
  final void Function()? onPressed;

  /// Set button variant.
  final GButtonVariant variant;

  /// A widget to display before the [label].
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case GButtonVariant.elevated:
        return _ElevatedButton(
          onPressed: onPressed,
          label: label,
          icon: icon,
        );
      case GButtonVariant.outlined:
        return _OutlinedButton(
          onPressed: onPressed,
          label: label,
          icon: icon,
        );
      case GButtonVariant.text:
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
