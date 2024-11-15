// lib/presentation/widgets/main/menu_modal.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

// lib/presentation/widgets/main/menu_modal.dart
class MenuModal extends StatelessWidget {
  final VoidCallback onClose;

  const MenuModal({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildModalBackground(),
        _buildModalContent(),
      ],
    );
  }

  Widget _buildModalBackground() {
    return Positioned.fill(
      child: GestureDetector(
        onTap: onClose,
        child: Container(color: Colors.transparent),
      ),
    );
  }

  Widget _buildModalContent() {
    return Positioned(
      left: 12,
      top: 120,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
          decoration: BoxDecoration(
            color: tertiaryColor,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMenuItem(
                icon: Icons.playlist_add,
                text: "Create Playlist",
                onTap: onClose,
              ),
              _buildMenuItem(
                icon: Icons.add,
                text: "Add Song",
                onTap: onClose,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return IntrinsicWidth(
      child: TextButton(
        onPressed: onTap,
        child: Row(
          children: [
            Icon(icon, color: primaryTextColor),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: smallFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
