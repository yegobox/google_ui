import 'package:flutter/material.dart';
import '../utils/index.dart';

/// Create a grouped drawer.
class GoogleGroupedDrawer extends StatelessWidget {
  const GoogleGroupedDrawer({
    Key? key,
    this.backgroundColor,
    this.isEnd = false,
    required this.index,
    required this.actions,
    this.secondaryActions,
    required this.children,
  }) : super(key: key);

  /// Set [GoogleGroupedDrawer] background color.
  final Color? backgroundColor;

  /// If true, display [actions] after [children].
  final bool isEnd;

  /// Pick children from index to display.
  final int index;

  /// A list of Widgets to control [index].
  final List<Widget> actions;

  /// A list of Widgets to display in a column after [actions].
  final List<Widget>? secondaryActions;

  /// A list of Widgets to display menus.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor = this.backgroundColor ?? colorScheme.surface;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: backgroundColor,
      ),
      child: SizedBox(
        width: 320,
        child: Drawer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: !isEnd
                ? [
                    _ActionBar(
                      backgroundColor: backgroundColor,
                      actions: actions,
                      secondaryActions: secondaryActions,
                    ),
                    const VerticalDivider(width: 0),
                    Expanded(child: SafeArea(child: children[index])),
                  ]
                : [
                    Expanded(child: SafeArea(child: children[index])),
                    const VerticalDivider(width: 0),
                    _ActionBar(
                      backgroundColor: backgroundColor,
                      actions: actions,
                      secondaryActions: secondaryActions,
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({
    Key? key,
    required this.backgroundColor,
    required this.actions,
    required this.secondaryActions,
  }) : super(key: key);

  final Color backgroundColor;
  final List<Widget> actions;
  final List<Widget>? secondaryActions;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.only(bottom: 16),
      color: GoogleColorUtil.darken(backgroundColor, 5),
      child: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(child: Column(children: actions)),
            if (secondaryActions != null) ...[
              const Spacer(),
              ...secondaryActions!,
            ]
          ],
        ),
      ),
    );
  }
}
