import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: "Button"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GElevatedButton(
              "Elevated",
              onPressed: () {},
            ),
            GTextButton(
              "Text",
              onPressed: () {},
            ),
            GOutlinedButton(
              "Outlined",
              onPressed: () {},
            ),
            GElevatedButton(
              "Elevated",
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            GTextButton(
              "Text",
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            GOutlinedButton(
              "Outlined",
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
