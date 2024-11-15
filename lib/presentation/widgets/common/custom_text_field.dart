// lib/presentation/widgets/common/custom_text_field.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isHovered;
  final Function(bool) onHover;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.isHovered,
    required this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: TextFormField(
        style: const TextStyle(color: primaryTextColor),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          hintText: hintText,
          hintStyle: const TextStyle(color: primaryTextColor),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryTextColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: secondaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isHovered ? secondaryColor : senaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
