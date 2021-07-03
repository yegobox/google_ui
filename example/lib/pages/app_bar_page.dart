import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class AppBarPage extends StatelessWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoogleAppBar(title: "App Bar"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const GoogleAppBar(
              title: "Simple App Bar",
              subtitle: "Google UI",
            ),
            const SizedBox(height: 16),
            GoogleCustomAppBar(
              title: Row(
                children: [
                  const CircleAvatar(),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      GoogleText("Custom App Bar"),
                      GoogleText(
                        "Subtitle",
                        variant: GoogleTextVariant.bodyText2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const GoogleSearchAppBar(
              title: "Search App Bar",
              hintText: "Search Item...",
              onFieldSubmitted: null,
              onClosePressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
