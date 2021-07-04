import 'package:example/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GoogleAppBar(title: "Google UI"),
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
    return GoogleDrawer(
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
              }),
          ListTile(
              title: const Text("App Bar"),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute(builder: (context) => const AppBarPage()),
                  );
              }),
          ListTile(
              title: const Text("Grouped Drawer"),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute(builder: (context) => const DrawerPage()),
                  );
              }),
          ListTile(
              title: const Text("Calendar"),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute(
                        builder: (context) => const CalendarPage()),
                  );
              }),
          ListTile(
              title: const Text("Typography"),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute(
                        builder: (context) => const TypographyPage()),
                  );
              }),
        ],
      ),
    );
  }
}
