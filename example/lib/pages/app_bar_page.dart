import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoogleAppBar(title: "App Bar"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const GoogleAppBar(
                title: "Simple App Bar",
                subtitle: "Google UI",
              ),
              const SizedBox(height: 16),
              const GoogleSearchAppBar(
                title: "Search App Bar",
                hintText: "Search Item...",
                onFieldSubmitted: null,
                onClosePressed: null,
              ),
              const SizedBox(height: 16),
              GoogleAppBar(
                title: "App Bar",
                subtitle: "With PopUpButton",
                actions: [
                  GooglePopupMenuButton(
                    children: [
                      GooglePopupMenuItem(
                        onPressed: () {},
                        icon: const Icon(Icons.sync),
                        label: "Sync",
                      ),
                      GooglePopupMenuItem(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                        label: "Settings",
                      ),
                      GooglePopupMenuItem(
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
      ),
    );
  }
}
