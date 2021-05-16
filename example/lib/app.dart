import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/home_page.dart';
import 'providers/theme_provider.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final themeProviderState = useProvider(themeProvider).state;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: GoogleTheme().apply(),
      darkTheme: GoogleTheme().apply(darkMode: true),
      themeMode: themeProviderState ? ThemeMode.dark : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
