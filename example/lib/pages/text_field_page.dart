import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';

class TextFieldPage extends HookWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: "TextField"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const GTextFormField(
                labelText: "Username Field",
                prefixIcon: Icon(Icons.person),
              ),
              const SizedBox(height: 16),
              const GTextFormField(
                labelText: "Password Field",
                prefixIcon: Icon(Icons.vpn_key),
                passwordField: true,
              ),
              const SizedBox(height: 16),
              GDateTextFormField(
                labelText: "Date Field",
                prefixIcon: const Icon(Icons.calendar_today),
                initialValue: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
