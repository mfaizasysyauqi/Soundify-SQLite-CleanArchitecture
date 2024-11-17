// lib/presentation/managers/modal_manager.dart
import 'package:flutter/material.dart';
import '../widgets/main/menu_modal.dart';
import '../widgets/modals/base_modal_overlay.dart';

class ModalManager {
  OverlayEntry? _overlayEntry;

  void showMenuModal(BuildContext context, VoidCallback onClose) {
    closeModal();
    
    _overlayEntry = OverlayEntry(
      builder: (context) => MenuModal(onClose: onClose),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void showDescriptionModal(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String content,
    required IconData icon,
    required Color iconColor,
    required Color containerColor,
    double? width,
    double? height,
  }) {
    closeModal();

    _overlayEntry = OverlayEntry(
      builder: (context) => BaseModalOverlay(
        title: title,
        subtitle: subtitle,
        content: content,
        icon: icon,
        iconColor: iconColor,
        containerColor: containerColor,
        width: width ?? 480,
        height: height ?? 300,
        onClose: closeModal,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void closeModal() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void dispose() {
    closeModal();
  }
}
