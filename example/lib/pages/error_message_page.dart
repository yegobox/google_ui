import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class ErrorMessagePage extends StatelessWidget {
  const ErrorMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: "Error Message"),
      body: GErrorMessage(
        title: "No internet",
        subtitle:
            "Can't connect to the internet.\nPlease check your internet connection",
        icon: const Icon(Icons.wifi_off),
        onPressed: () {},
      ),
    );
  }
}
