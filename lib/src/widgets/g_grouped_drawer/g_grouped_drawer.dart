import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:spring/spring.dart';

import 'g_grouped_drawer_action_bar.dart';

/// Create a grouped drawer.
class GGroupedDrawer extends HookWidget {
  const GGroupedDrawer({
    Key? key,
    this.actionColor,
    this.actionSelectedColor,
    this.backgroundColor,
    this.initialIndex,
    this.onPageChanged,
    this.isEnd = false,
    required this.actions,
    this.secondaryActions,
    required this.children,
  })  : assert(actions.length == children.length),
        super(key: key);

  /// Set [GGroupedDrawerAction] icon color.
  final Color? actionColor;

  /// Set [GGroupedDrawerAction] on selected icon color.
  final Color? actionSelectedColor;

  /// Set [GGroupedDrawer] background color.
  final Color? backgroundColor;

  /// initial page index.
  final int? initialIndex;

  final void Function(int index)? onPageChanged;

  /// If true, display [actions] after [children].
  final bool isEnd;

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

    final pageIndex = useState(initialIndex ?? 0);
    final scrollController = useState(ScrollController());

    final List<Widget> drawerChildren = [
      GGroupedDrawerActionBar(
        actionColor: actionColor,
        actionSelectedColor: actionSelectedColor,
        isSelected: (index) => index == pageIndex.value,
        onPressed: (index) {
          pageIndex.value = index;
          scrollController.value.jumpTo(0);
          if (onPageChanged != null) onPageChanged!(index);
        },
        actions: actions,
        secondaryActions: secondaryActions,
      ),
      const VerticalDivider(width: 0),
      Expanded(
        child: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController.value,
            child: Spring.scale(
              start: 0.75,
              end: 1,
              curve: standardEasing,
              animDuration: const Duration(milliseconds: 250),
              child: Spring.fadeIn(
                curve: standardEasing,
                animDuration: const Duration(milliseconds: 250),
                child: children[pageIndex.value],
              ),
            ),
          ),
        ),
      ),
    ];

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: backgroundColor,
      ),
      child: SizedBox(
        width: 320,
        child: Drawer(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                !isEnd ? drawerChildren : drawerChildren.reversed.toList(),
          ),
        ),
      ),
    );
  }
}
