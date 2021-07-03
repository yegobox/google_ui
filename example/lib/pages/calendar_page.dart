import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GoogleAppBar(title: "Calendar"),
      body: GoogleCalendar(),
    );
  }
}
