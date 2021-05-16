import 'package:flutter/material.dart';

class GoogleList extends StatelessWidget {
  const GoogleList({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.enableDivider = false,
    this.padding,
  }) : super(key: key);

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool enableDivider;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _createItem(context),
      ),
    );
  }

  List<Widget> _createItem(BuildContext context) {
    final List<Widget> widgets = [];

    for (int i = 0; i < itemCount; i++) {
      widgets.add(itemBuilder(context, i));
      if (i != itemCount - 1 && enableDivider) {
        widgets.add(const Divider());
      }
    }
    return widgets;
  }
}
