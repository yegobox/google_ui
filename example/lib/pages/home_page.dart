import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

import 'index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GAppBar(title: "Google UI"),
      drawer: _PageDrawer(),
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}

class _PageDrawer extends StatelessWidget {
  const _PageDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GDrawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("Button"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(builder: (context) => const ButtonPage()),
                );
            },
          ),
          ListTile(
            title: const Text("Text Field"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(
                      builder: (context) => const TextFieldPage()),
                );
            },
          ),
          ListTile(
            title: const Text("App Bar"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(builder: (context) => const AppBarPage()),
                );
            },
          ),
          ListTile(
            title: const Text("Tab Bar"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(builder: (context) => const TabBarPage()),
                );
            },
          ),
          ListTile(
            title: const Text("Select Box"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(
                      builder: (context) => const SelectBoxPage()),
                );
            },
          ),
          ListTile(
            title: const Text("Grouped Drawer"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(builder: (context) => const DrawerPage()),
                );
            },
          ),
          ListTile(
            title: const Text("Calendar"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(builder: (context) => const CalendarPage()),
                );
            },
          ),
          ListTile(
            title: const Text("Error Message"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(
                      builder: (context) => const ErrorMessagePage()),
                );
            },
          ),
          ListTile(
            title: const Text("Typography"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(
                      builder: (context) => const TypographyPage()),
                );
            },
          ),
        ],
      ),
    );
  }
}
