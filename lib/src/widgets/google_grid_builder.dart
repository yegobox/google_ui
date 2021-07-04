import 'package:flutter/material.dart';

/// Create a scrollable grid by wrapping [GoogleGrid] with [ListView.builder].
class GoogleGridBuilder extends StatelessWidget {
  const GoogleGridBuilder({
    Key? key,
    this.columnCount = 2,
    this.gap,
    this.padding,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  /// Number of column.
  final int columnCount;

  /// Gap to separate each cell.
  final double? gap;

  /// An empty space.
  final EdgeInsets? padding;

  /// Providing a non-null itemCount improves the ability of the [ListView] to estimate the maximum scroll extent.
  final int itemCount;

  /// The itemBuilder callback will be called only with indices greater than or equal to zero and less than itemCount.
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final rows = _createRows(context);

    return ListView.builder(
      padding: padding,
      itemCount: rows.length,
      itemBuilder: (context, index) => rows[index],
    );
  }

  List<Widget> _createRows(BuildContext context) {
    final List<Widget> rows = [];
    final rowCount = (itemCount / columnCount).ceil();

    for (int rowIndex = 0; rowIndex < rowCount; rowIndex++) {
      final List<Widget> columns = _createColumns(context, rowIndex);
      rows.add(Row(children: columns));
      if (rowIndex != rowCount - 1) rows.add(SizedBox(height: gap));
    }

    return rows;
  }

  List<Widget> _createColumns(BuildContext context, int rowIndex) {
    final List<Widget> columns = [];

    for (int columnIndex = 0; columnIndex < columnCount; columnIndex++) {
      final cellIndex = rowIndex * columnCount + columnIndex;
      if (cellIndex <= itemCount - 1) {
        columns.add(Expanded(child: itemBuilder(context, cellIndex)));
      } else {
        columns.add(Expanded(child: Container()));
      }
      if (columnIndex != columnCount - 1) columns.add(SizedBox(width: gap));
    }

    return columns;
  }
}
