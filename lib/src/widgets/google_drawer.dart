import 'package:flutter/material.dart';

class GoogleDrawer extends StatelessWidget {
  const GoogleDrawer({
    Key? key,
    this.backgroundColor,
    required this.child,
    this.custom = false,
  }) : super(key: key);

  final Color? backgroundColor;
  final Widget child;
  final bool custom;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: backgroundColor ?? colorScheme.surface,
      ),
      child: Drawer(
        child: !custom
            ? SafeArea(
                child: SingleChildScrollView(
                  child: child,
                ),
              )
            : child,
      ),
    );
  }
}
