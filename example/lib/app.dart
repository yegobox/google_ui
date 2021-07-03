import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const theme = GoogleTheme();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme.apply(),
      darkTheme: theme.apply(darkMode: true),
      home: const HomePage(),
    );
  }
}
