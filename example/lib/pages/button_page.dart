import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: "Button"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GButton(
                "Elevated".toUpperCase(),
                onPressed: () {},
              ),
              GButton(
                "Text".toUpperCase(),
                onPressed: () {},
                variant: GButtonVariant.text,
              ),
              GButton(
                "Outlined".toUpperCase(),
                onPressed: () {},
                variant: GButtonVariant.outlined,
              ),
              GButton(
                "Elevated".toUpperCase(),
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
              GButton(
                "Text".toUpperCase(),
                onPressed: () {},
                variant: GButtonVariant.text,
                icon: const Icon(Icons.add),
              ),
              GButton(
                "Outlined".toUpperCase(),
                onPressed: () {},
                variant: GButtonVariant.outlined,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
