import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';

class CalendarPage extends HookWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageController = useState(PageController());

    return Scaffold(
      appBar: const GoogleAppBar(title: "Calendar"),
      body: SingleChildScrollView(
        child: GoogleCalendarTimeline(controller: pageController.value),
      ),
    );
  }
}
