import 'package:flutter/material.dart';

/// Create a bottom bar.
class GoogleBottomBar extends StatelessWidget {
  const GoogleBottomBar({
    Key? key,
    this.backgroundColor,
    this.padding,
    this.child,
  }) : super(key: key);

  /// Set [GoogleBottomBar] background color.
  final Color? backgroundColor;

  /// Empty space.
  final EdgeInsetsGeometry? padding;

  /// The widget below this widget in the tree.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        boxShadow: const [BoxShadow(blurRadius: 8, offset: Offset(0, 4))],
      ),
      child: child,
    );
  }
}
