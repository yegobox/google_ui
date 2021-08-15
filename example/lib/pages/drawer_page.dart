import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _scrollControllerProvider = Provider.autoDispose((ref) {
  return ScrollController();
});

class DrawerPage extends HookWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final drawerIndex = useState(0);

    return Scaffold(
      appBar: GAppBar(
        title: "Grouped Drawer",
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      drawer: _GroupedDrawer(
        drawerIndex: drawerIndex,
        colorScheme: colorScheme,
      ),
      endDrawer: _GroupedDrawer(
        isEnd: true,
        drawerIndex: drawerIndex,
        colorScheme: colorScheme,
      ),
      body: const _PageBody(),
    );
  }
}

class _GroupedDrawer extends StatelessWidget {
  const _GroupedDrawer({
    Key? key,
    this.isEnd = false,
    required this.drawerIndex,
    required this.colorScheme,
  }) : super(key: key);

  final bool isEnd;
  final ValueNotifier<int> drawerIndex;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return GGroupedDrawer(
      isEnd: isEnd,
      index: drawerIndex.value,
      actions: [
        const SizedBox(height: 8),
        _ActionButton(
          index: 0,
          drawerIndex: drawerIndex,
          icons: Icons.shopping_cart,
        ),
        const SizedBox(height: 8),
        _ActionButton(
          index: 1,
          drawerIndex: drawerIndex,
          icons: Icons.dashboard,
        ),
        const SizedBox(height: 8),
        _ActionButton(
          index: 2,
          drawerIndex: drawerIndex,
          icons: Icons.language,
        ),
      ],
      secondaryActions: [
        IconButton(
          icon: Icon(
            Icons.play_circle_outline,
            color: colorScheme.onSurface.withOpacity(.75),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.help_outline,
            color: colorScheme.onSurface.withOpacity(.75),
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: colorScheme.onSurface.withOpacity(.75),
          ),
          onPressed: () {},
        ),
      ],
      children: const [
        _DrawerMenu(pageNumber: 1),
        _DrawerMenu(pageNumber: 2),
        _DrawerMenu(pageNumber: 3),
      ],
    );
  }
}

class _ActionButton extends HookWidget {
  const _ActionButton({
    Key? key,
    required this.index,
    required this.drawerIndex,
    required this.icons,
  }) : super(key: key);

  final int index;
  final ValueNotifier<int> drawerIndex;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    final scrollController = useProvider(_scrollControllerProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      icon: Icon(
        icons,
        color: drawerIndex.value == index
            ? colorScheme.primary
            : colorScheme.onSurface.withOpacity(.75),
      ),
      onPressed: () {
        if (drawerIndex.value != index) {
          scrollController.jumpTo(0);
          drawerIndex.value = index;
        }
      },
    );
  }
}

class _DrawerMenu extends HookWidget {
  const _DrawerMenu({Key? key, required this.pageNumber}) : super(key: key);

  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    final scrollController = useProvider(_scrollControllerProvider);
    final links = <Widget>[];
    for (int i = 0; i < 20; i++) {
      links.add(
        ListTile(
          title: Text("Link ${i + 1}"),
          onTap: () {},
        ),
      );
    }

    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [GSectionTitle("Page $pageNumber"), ...links],
      ),
    );
  }
}

class _PageBody extends StatelessWidget {
  const _PageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Grouped drawer is inspired by the drawer in microsoft outlook apk",
              ),
              const SizedBox(height: 8),
              GButton(
                "Open grouped drawer",
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
              GButton(
                "Open end grouped drawer",
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
