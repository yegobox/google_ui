import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoogleAppBar(title: "Button"),
      body: SingleChildScrollView(
        child: Padding(
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
              const Divider(height: 32),
              const Text(
                  "GoogleIconButton is an alternative to IconButton, the main difference is in the size of the splash effect"),
              const SizedBox(height: 8),
              Row(
                children: [
                  GoogleIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                  ),
                  GoogleIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back),
                  ),
                  GoogleIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
