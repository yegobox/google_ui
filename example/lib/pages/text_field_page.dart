import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class TextFieldPage extends StatelessWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: "TextField"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              GTextFormField(
                labelText: "Username Field",
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 16),
              GTextFormField(
                labelText: "Password Field",
                prefixIcon: Icon(Icons.vpn_key),
                passwordField: true,
              ),
              SizedBox(height: 16),
              GDateTextFormField(
                labelText: "Date Field",
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
