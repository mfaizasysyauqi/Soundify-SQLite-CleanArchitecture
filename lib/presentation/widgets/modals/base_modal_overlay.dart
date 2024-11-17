// lib/presentation/widgets/modals/base_modal_overlay.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

class BaseModalOverlay extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;
  final IconData icon;
  final Color iconColor;
  final Color containerColor;
  final VoidCallback onClose;
  final double width;
  final double height;

  const BaseModalOverlay({
    super.key,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.icon,
    required this.iconColor,
    required this.containerColor,
    required this.onClose,
    this.width = 480,
    this.height = 300,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildModalBackground(),
        Center(
          child: Material(
            color: Colors.transparent,
            child: _buildModalContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildModalBackground() {
    return Positioned.fill(
      child: GestureDetector(
        onTap: onClose,
        child: Container(
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildModalContent() {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: tertiaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildModalHeader(),
          const Divider(thickness: 1, color: primaryTextColor),
          _buildModalBody(),
        ],
      ),
    );
  }

  Widget _buildModalHeader() {
    return Row(
      children: [
        _buildIcon(),
        const SizedBox(width: 10),
        Expanded(child: _buildHeaderInfo()),
        _buildCloseButton(),
      ],
    );
  }

  Widget _buildIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        height: 50,
        width: 50,
        child: Container(
          color: containerColor,
          child: Icon(
            icon,
            color: iconColor,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: primaryTextColor,
            fontWeight: fontWeightBold,
            fontSize: smallFontSize,
          ),
        ),
        Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: quaternaryTextColor,
            fontWeight: fontWeightMedium,
            fontSize: microFontSize,
          ),
        ),
      ],
    );
  }

  Widget _buildCloseButton() {
    return IconButton(
      onPressed: onClose,
      icon: const Icon(Icons.close, color: primaryTextColor),
    );
  }

  Widget _buildModalBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Text(
          content,
          style: const TextStyle(
            color: quaternaryTextColor,
            fontWeight: fontWeightMedium,
            fontSize: microFontSize,
          ),
        ),
      ),
    );
  }
}