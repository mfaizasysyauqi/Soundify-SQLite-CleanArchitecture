// lib/presentation/widgets/common/custom_button.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isHovered;
  final Function(bool) onHover;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isHovered,
    required this.onHover,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: SizedBox(
        height: 42,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isHovered ? secondaryColor : tertiaryColor,
          ),
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(
                    color: isHovered ? tertiaryColor : secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
