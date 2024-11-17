// lib/presentation/screens/app/primary/home/home_widget.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/providers/widget_size_provider.dart';
import 'package:soundify/presentation/widgets/collection/collection_table_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minContentWidth = 360;
    double providedMaxWidth =
        Provider.of<WidgetSizeProvider>(context).expandedWidth;
    double adjustedMaxWidth =
        providedMaxWidth.clamp(minContentWidth, double.infinity);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: minContentWidth,
              maxWidth: screenWidth.clamp(
                minContentWidth,
                adjustedMaxWidth,
              ),
            ),
            child: CollectionTableHeader(
              screenWidth: screenWidth,
              columns: _getTableColumns(),
            ),
          ),
        ),
      ),
    );
  }

  List<TableColumnConfig> _getTableColumns() {
    return [
      const TableColumnConfig(
        title: '#',
        width: FixedColumnWidth(50),
        showAtWidth: 0,
      ),
      const TableColumnConfig(
        title: 'Title',
        width: FlexColumnWidth(2),
        showAtWidth: 0,
      ),
      const TableColumnConfig(
        title: 'Album',
        width: FlexColumnWidth(2),
        showAtWidth: 1280,
      ),
      const TableColumnConfig(
        title: 'Date Added',
        width: FlexColumnWidth(2),
        showAtWidth: 1480,
      ),
      TableColumnConfig(
        title: '',
        width: const FixedColumnWidth(168),
        showAtWidth: 0,
        builder: () => const Icon(
          Icons.access_time,
          color: primaryTextColor,
        ),
      ),
    ];
  }
}
