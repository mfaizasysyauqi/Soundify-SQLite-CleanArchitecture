// lib/presentation/widgets/home/song_table_header.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/presentation/widgets/home/table_header_cell.dart';

class SongTableHeader extends StatelessWidget {
  const SongTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Table(
          border: TableBorder.all(
            color: transparentColor,
            width: 1,
          ),
          columnWidths: _getColumnWidths(context),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: _buildTableHeaders(context),
            ),
          ],
        ),
      ),
    );
  }

  Map<int, TableColumnWidth> _getColumnWidths(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return {
      0: const FixedColumnWidth(50),  // # column
      1: const FlexColumnWidth(4),    // Title column (increased flex)
      2: screenWidth > 1280
          ? const FlexColumnWidth(3)  // Album column
          : const FixedColumnWidth(0),
      3: screenWidth > 1480
          ? const FlexColumnWidth(3)  // Date added column
          : const FixedColumnWidth(0),
      4: const FixedColumnWidth(168), // Duration column
    };
  }

  List<Widget> _buildTableHeaders(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return [
      const TableHeaderCell(text: "#", alignment: TextAlign.right),
      const TableHeaderCell(text: "Title"),
      if (screenWidth > 1280)
        const TableHeaderCell(text: "Album")
      else
        const SizedBox.shrink(),
      if (screenWidth > 1480)
        const TableHeaderCell(text: "Date added")
      else
        const SizedBox.shrink(),
      const DurationHeaderCell(),
    ];
  }
}