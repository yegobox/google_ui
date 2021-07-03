import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoogleAppBar(title: "Button"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoogleButton(
              "Elevated".toUpperCase(),
              onPressed: () {},
            ),
            GoogleButton(
              "Text".toUpperCase(),
              onPressed: () {},
              variant: GoogleButtonVariant.text,
            ),
            GoogleButton(
              "Outlined".toUpperCase(),
              onPressed: () {},
              variant: GoogleButtonVariant.outlined,
            ),
            GoogleButton(
              "Elevated".toUpperCase(),
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            GoogleButton(
              "Text".toUpperCase(),
              onPressed: () {},
              variant: GoogleButtonVariant.text,
              icon: const Icon(Icons.add),
            ),
            GoogleButton(
              "Outlined".toUpperCase(),
              onPressed: () {},
              variant: GoogleButtonVariant.outlined,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
