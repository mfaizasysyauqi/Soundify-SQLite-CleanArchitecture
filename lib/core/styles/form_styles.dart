// lib/core/styles/form_styles.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

class FormStyles {
  static InputDecoration textFieldDecoration({
    required IconData icon,
    required String hintText,
    required bool isHovered,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(8),
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(icon, color: primaryTextColor),
          ),
          const VerticalDivider(
            color: primaryTextColor,
            width: 1,
            thickness: 1,
          ),
          const SizedBox(width: 12),
        ],
      ),
      suffixIcon: suffixIcon,
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
    );
  }
}
