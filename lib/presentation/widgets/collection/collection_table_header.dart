// lib/presentation/widgets/collection/collection_table_header.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

class CollectionTableHeader extends StatelessWidget {
  final double screenWidth;
  final List<TableColumnConfig> columns;

  const CollectionTableHeader({
    super.key,
    required this.screenWidth,
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: _buildTable(),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(color: primaryTextColor),
        ),
      ],
    );
  }

  Widget _buildTable() {
    return Table(
      border: TableBorder.all(
        color: transparentColor,
        width: 1,
      ),
      columnWidths: _getColumnWidths(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: _buildTableCells(),
        ),
      ],
    );
  }

  Map<int, TableColumnWidth> _getColumnWidths() {
    Map<int, TableColumnWidth> widths = {};
    for (var i = 0; i < columns.length; i++) {
      if (columns[i].showAtWidth <= screenWidth) {
        widths[i] = columns[i].width;
      }
    }
    return widths;
  }

  List<Widget> _buildTableCells() {
    return columns
        .where((column) => column.showAtWidth <= screenWidth)
        .map((column) => _buildCell(column))
        .toList();
  }

  Widget _buildCell(TableColumnConfig column) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: transparentColor),
      ),
      child: column.builder?.call() ??
          Align(
            alignment: column.title == '#'
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              column.title,
              style: const TextStyle(
                color: primaryTextColor,
                fontWeight: fontWeightMedium,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
    );
  }
}

class TableColumnConfig {
  final String title;
  final TableColumnWidth width;
  final double showAtWidth;
  final Widget Function()? builder;

  const TableColumnConfig({
    required this.title,
    required this.width,
    required this.showAtWidth,
    this.builder,
  });
}
