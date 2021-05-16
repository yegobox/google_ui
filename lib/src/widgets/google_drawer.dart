import 'package:flutter/material.dart';

class GoogleDrawer extends StatelessWidget {
  const GoogleDrawer({
    Key? key,
    this.backgroundColor,
    required this.children,
  }) : super(key: key);

  final Color? backgroundColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: backgroundColor ?? colorScheme.surface),
      child: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
