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
            children: const [
              GoogleAppBar(
                title: "Simple App Bar",
                subtitle: "Google UI",
              ),
              SizedBox(height: 16),
              GoogleSearchAppBar(
                title: "Search App Bar",
                hintText: "Search Item...",
                onFieldSubmitted: null,
                onClosePressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
