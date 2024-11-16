// lib/presentation/widgets/home/table_cells.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

class TableHeaderCell extends StatelessWidget {
  final String text;
  final TextAlign alignment;

  const TableHeaderCell({
    super.key,
    required this.text,
    this.alignment = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: transparentColor),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: primaryTextColor,
          fontWeight: mediumWeight,
        ),
        textAlign: alignment,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class DurationHeaderCell extends StatelessWidget {
  const DurationHeaderCell({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 45),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(color: transparentColor),
          ),
          child: const SizedBox(
            width: 50,
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.access_time,
                color: primaryTextColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 40),
      ],
    );
  }
}
