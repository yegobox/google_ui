import 'package:flutter/material.dart';

class GoogleBottomBar extends StatelessWidget {
  const GoogleBottomBar({
    Key? key,
    this.color,
    this.padding,
    this.child,
  }) : super(key: key);

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? colorScheme.surface,
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
