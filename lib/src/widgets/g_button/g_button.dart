import 'package:flutter/material.dart';

/// Variant for [GButton].
enum GButtonVariant { elevated, outlined, text }

/// Create a button.
@Deprecated("")
class GButton extends StatelessWidget {
  const GButton(
    this.label, {
    Key? key,
    required this.onPressed,
    this.variant = GButtonVariant.elevated,
    this.icon,
    this.color,
    this.colorBuilder,
  }) : super(key: key);

  /// Text that describes the button.
  final String label;

  /// A callback after the user click the button.
  final void Function()? onPressed;

  /// Set button variant.
  final GButtonVariant variant;

  /// A widget to display before the [label].
  final Widget? icon;

  /// Set button color
  final Color? color;

  /// Set button color using colorBuilder
  final Color? Function(ColorScheme)? colorBuilder;

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ??
        (colorBuilder != null
            ? colorBuilder!(Theme.of(context).colorScheme)
            : null);

    switch (variant) {
      case GButtonVariant.elevated:
        return _ElevatedButton(
          onPressed: onPressed,
          label: label,
          icon: icon,
          buttonColor: buttonColor,
        );
      case GButtonVariant.outlined:
        return _OutlinedButton(
          onPressed: onPressed,
          label: label,
          icon: icon,
          buttonColor: buttonColor,
        );
      case GButtonVariant.text:
        return _TextButton(
          onPressed: onPressed,
          label: label,
          icon: icon,
          buttonColor: buttonColor,
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
    this.buttonColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final Widget? icon;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = TextButton.styleFrom(primary: buttonColor);

    return icon == null
        ? TextButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: Text(label),
          )
        : TextButton.icon(
            style: buttonStyle,
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
    this.buttonColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final Widget? icon;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = OutlinedButton.styleFrom(primary: buttonColor);

    return icon == null
        ? OutlinedButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: Text(label),
          )
        : OutlinedButton.icon(
            style: buttonStyle,
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
    this.buttonColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final String label;
  final Widget? icon;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(primary: buttonColor);

    return icon == null
        ? ElevatedButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: Text(label),
          )
        : ElevatedButton.icon(
            style: buttonStyle,
            onPressed: onPressed,
            icon: icon!,
            label: Text(label),
          );
  }
}
