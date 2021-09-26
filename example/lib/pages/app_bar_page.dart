import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';

class AppBarPage extends HookWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: "App Bar"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const GAppBar(
              title: "Simple App Bar",
              subtitle: "Google UI",
            ),
            const SizedBox(height: 16),
            const GSearchAppBar(
              title: "Search App Bar",
              hintText: "Search Item...",
              cursorColor: Colors.red,
            ),
            const SizedBox(height: 16),
            GAppBar(
              title: "App Bar",
              subtitle: "With PopUpButton",
              actions: [
                GPopupMenuButton(
                  children: [
                    GPopupMenuItem(
                      onPressed: () {},
                      icon: const Icon(Icons.sync),
                      label: "Sync",
                    ),
                    GPopupMenuItem(
                      onPressed: () {},
                      icon: const Icon(Icons.settings),
                      label: "Settings",
                    ),
                    GPopupMenuItem(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                      label: "Logout",
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
