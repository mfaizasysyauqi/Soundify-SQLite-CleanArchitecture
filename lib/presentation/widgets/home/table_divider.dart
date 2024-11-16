// lib/presentation/widgets/home/table_divider.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/text_styles.dart';

class TableDivider extends StatelessWidget {
  const TableDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(
        color: primaryTextColor,
      ),
    );
  }
}