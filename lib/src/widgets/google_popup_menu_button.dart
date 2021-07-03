import 'package:flutter/material.dart';

class GooglePopupMenuItem {
  final String label;
  final void Function() onPressed;

  GooglePopupMenuItem({
    required this.label,
    required this.onPressed,
  });
}

class GooglePopupMenuButton extends StatelessWidget {
  const GooglePopupMenuButton({Key? key, required this.children})
      : super(key: key);

  final List<GooglePopupMenuItem> children;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<void Function()>(
      itemBuilder: (context) => children
          .map((e) => PopupMenuItem(value: e.onPressed, child: Text(e.label)))
          .toList(),
      onSelected: (value) => value(),
    );
  }
}
