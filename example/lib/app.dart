import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: GThemeGenerator.generate(),
      darkTheme: GThemeGenerator.generateDark(),
      home: const HomePage(),
    );
  }
}
