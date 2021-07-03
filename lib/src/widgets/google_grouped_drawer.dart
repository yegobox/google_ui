import 'package:flutter/material.dart';

import 'google_icon_button.dart';

class GoogleGroupedDrawer extends StatelessWidget {
  const GoogleGroupedDrawer({
    Key? key,
    required this.index,
    required this.onChanged,
    required this.groups,
    required this.groupViews,
    this.additionalChildren,
    this.backgroundColor,
  }) : super(key: key);

  final int index;
  final void Function(int index) onChanged;
  final List<IconData> groups;
  final List<Widget> groupViews;
  final List<Widget>? additionalChildren;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: backgroundColor ?? colorScheme.surface,
      ),
      child: SizedBox(
        width: 320,
        child: Drawer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _GroupButtons(
                index: index,
                onChanged: onChanged,
                groups: groups,
                additionalChildren: additionalChildren,
              ),
              const VerticalDivider(width: 0),
              SafeArea(child: groupViews[index])
            ],
          ),
        ),
      ),
    );
  }
}

class _GroupButtons extends StatelessWidget {
  const _GroupButtons({
    Key? key,
    required this.index,
    required this.onChanged,
    required this.groups,
    this.additionalChildren,
  }) : super(key: key);

  final int index;
  final void Function(int index) onChanged;
  final List<IconData> groups;
  final List<Widget>? additionalChildren;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFF5F5F5),
      child: SafeArea(
        child: Column(
          children: [
            Builder(builder: (context) {
              final colorScheme = Theme.of(context).colorScheme;
              final groupButtons = <Widget>[];

              for (int i = 0; i < groups.length; i++) {
                groupButtons.add(
                  GoogleIconButton(
                    icon: Icon(
                      groups[i],
                      color: i == index ? colorScheme.primary : null,
                    ),
                    onPressed: () => onChanged(i),
                  ),
                );
              }
              return SingleChildScrollView(
                child: Column(children: groupButtons),
              );
            }),
            const Spacer(),
            if (additionalChildren != null) ...additionalChildren!
          ],
        ),
      ),
    );
  }
}
