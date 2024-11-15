// lib/presentation/widgets/player/controls/skip_button.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/text_styles.dart';
import '../../../../core/styles/colors.dart';

class SkipButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const SkipButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<SkipButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Icon(
          widget.icon,
          color: isHovered ? secondaryColor : quaternaryTextColor,
          size: 28,
        ),
      ),
    );
  }
}
