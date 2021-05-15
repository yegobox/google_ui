import 'package:flutter/material.dart';

class GoogleListView extends StatelessWidget {
  const GoogleListView({
    Key? key,
    this.itemExtent,
    required this.itemCount,
    required this.itemBuilder,
    this.enableDivider = false,
    this.padding,
    this.reverse = false,
    this.controller,
    this.physics,
  }) : super(key: key);

  final double? itemExtent;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool enableDivider;
  final EdgeInsetsGeometry? padding;
  final bool reverse;
  final ScrollController? controller;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    if (enableDivider) {
      return ListView.separated(
        physics: physics,
        controller: controller,
        padding: padding,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: (context, index) {
          return const Divider();
        },
      );
    }
    return ListView.builder(
      physics: physics,
      controller: controller,
      reverse: reverse,
      padding: padding,
      itemExtent: itemExtent,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
