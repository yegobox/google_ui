import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';
import 'pages/home_page.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GoogleTheme().apply(),
      home: const HomePage(),
    );
  }
}
