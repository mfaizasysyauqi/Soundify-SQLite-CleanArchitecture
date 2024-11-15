// lib/presentation/widgets/common/hover_widget.dart
import 'package:flutter/material.dart';

class HoverWidget extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const HoverWidget({
    super.key,
    required this.builder,
  });

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _handleHoverChange(true),
      onExit: (_) => _handleHoverChange(false),
      child: widget.builder(isHovered),
    );
  }

  void _handleHoverChange(bool value) {
    if (mounted) {
      setState(() {
        isHovered = value;
      });
    }
  }
}
