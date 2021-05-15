import 'package:flutter/material.dart';

class GoogleGrid extends StatelessWidget {
  const GoogleGrid({
    Key? key,
    this.columnCount = 2,
    required this.children,
    this.gap,
    this.padding,
    this.margin,
    this.expanded = false,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  final int columnCount;
  final List<Widget> children;
  final double? gap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool expanded;
  final MainAxisAlignment rowMainAxisAlignment;
  final CrossAxisAlignment rowCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = [];

    final childrenLength = children.length;
    final rowCount = (childrenLength / columnCount).ceil();
    for (int i = 0; i < rowCount; i++) {
      final List<Widget> row = [];
      for (int x = 0; x < columnCount; x++) {
        final index = i * columnCount + x;
        if (index <= childrenLength - 1) {
          row.add(Expanded(child: children[index]));
        } else {
          row.add(Expanded(child: Container()));
        }
        if (x != columnCount - 1) {
          row.add(SizedBox(width: gap));
        }
      }
      widgets.add(expanded
          ? Expanded(
              child: Row(
                mainAxisAlignment: rowMainAxisAlignment,
                crossAxisAlignment: rowCrossAxisAlignment,
                children: row,
              ),
            )
          : Row(
              mainAxisAlignment: rowMainAxisAlignment,
              crossAxisAlignment: rowCrossAxisAlignment,
              children: row,
            ));

      if (i != rowCount - 1) {
        widgets.add(SizedBox(height: gap));
      }
    }

    return Container(
      padding: padding,
      margin: margin,
      child: Column(children: widgets),
    );
  }
}
