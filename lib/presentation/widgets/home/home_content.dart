// lib/presentation/widgets/home/home_content.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundify/presentation/providers/widget_size_provider.dart';
import 'package:soundify/presentation/widgets/home/song_table_header.dart';
import 'package:soundify/presentation/widgets/home/table_divider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minContentWidth = 360;
    double providedMaxWidth =
        Provider.of<WidgetSizeProvider>(context).expandedWidth;
    double adjustedMaxWidth =
        providedMaxWidth.clamp(minContentWidth, double.infinity);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: minContentWidth,
          maxWidth: screenWidth.clamp(
            minContentWidth,
            adjustedMaxWidth,
          ),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SongTableHeader(),
            TableDivider(),
          ],
        ),
      ),
    );
  }
}