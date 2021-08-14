import 'package:flutter/material.dart';

class GCard extends StatelessWidget {
  const GCard({
    Key? key,
    this.elevation,
    this.clipBehavior,
    this.color,
    this.shadowColor,
    this.borderRadius,
    this.onTap,
    this.onLongPress,
    this.padding,
    required this.child,
  }) : super(key: key);

  final double? elevation;
  final Clip? clipBehavior;
  final Color? color;
  final Color? shadowColor;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      clipBehavior: clipBehavior ?? Clip.antiAlias,
      color: color,
      shadowColor: shadowColor,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
