import 'package:flutter/material.dart';

import '../models/index.dart';
import 'index.dart';

class GoogleMenuPage extends StatelessWidget {
  const GoogleMenuPage({
    Key? key,
    this.title,
    this.subtitle,
    required this.googleMenuItems,
    this.actions,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final List<GoogleMenuItem> googleMenuItems;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoogleAppBar(title: title, subtitle: subtitle, actions: actions),
      body: ListView.builder(
        itemCount: googleMenuItems.length,
        itemBuilder: (context, index) {
          final googleMenuItem = googleMenuItems[index];
          return _ListTile(googleMenuItem: googleMenuItem);
        },
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    Key? key,
    required this.googleMenuItem,
  }) : super(key: key);

  final GoogleMenuItem googleMenuItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: googleMenuItem.icon,
      title: GoogleText(googleMenuItem.title),
      subtitle: GoogleConditional.isTrue(
        condition: googleMenuItem.subtitle != null,
        onTrue: GoogleText(googleMenuItem.subtitle ?? ""),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => googleMenuItem.page),
        );
      },
    );
  }
}
