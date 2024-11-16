// lib/presentation/widgets/primary/home_widget.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/presentation/widgets/home/home_content.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: const HomeContent(),
      ),
    );
  }
}
