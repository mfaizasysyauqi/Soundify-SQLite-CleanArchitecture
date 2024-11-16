// lib/presentation/widgets/common/hover_form_field.dart
import 'package:flutter/material.dart';

import 'package:soundify/core/styles/form_styles.dart';
import 'package:soundify/core/styles/text_styles.dart';

class HoverFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onIconPressed;

  const HoverFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.readOnly = false,
    this.suffixIcon,
    this.onIconPressed,
  });

  @override
  State<HoverFormField> createState() => _HoverFormFieldState();
}

class _HoverFormFieldState extends State<HoverFormField> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: TextFormField(
          style: const TextStyle(color: primaryTextColor),
          controller: widget.controller,
          readOnly: widget.readOnly,
          decoration: FormStyles.textFieldDecoration(
            icon: widget.icon,
            hintText: widget.hintText,
            isHovered: isHovered,
            suffixIcon: widget.suffixIcon,
          ),
        ),
      ),
    );
  }
}
