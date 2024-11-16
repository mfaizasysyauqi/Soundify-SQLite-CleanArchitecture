// lib/presentation/widgets/common/custom_button.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isHovered;
  final Function(bool) onHover;
  final bool isLoading;
  final double? width; // Tambah width optional
  final double height; // Buat height configurable
  final BorderRadius? borderRadius; // Custom border radius
  final Color? customColor; // Custom color option
  final Color? customHoverColor; // Custom hover color
  final TextStyle? textStyle; // Custom text style

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isHovered,
    required this.onHover,
    this.isLoading = false,
    this.width,
    this.height = 42,
    this.borderRadius,
    this.customColor,
    this.customHoverColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isHovered
                ? (customHoverColor ?? secondaryColor)
                : (customColor ?? tertiaryColor),
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
            ),
            elevation: isHovered ? 2 : 1,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(primaryTextColor),
                  ),
                )
              : Text(
                  text,
                  style: textStyle ??
                      TextStyle(
                        color: isHovered ? tertiaryColor : secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
        ),
      ),
    );
  }
}
