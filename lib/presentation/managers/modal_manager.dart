// lib/presentation/managers/modal_manager.dart
import 'package:flutter/material.dart';
import '../widgets/main/menu_modal.dart';

class ModalManager {
  OverlayEntry? _overlayEntry;

  void showModal(BuildContext context, VoidCallback onClose) {
    closeModal();
    
    _overlayEntry = OverlayEntry(
      builder: (context) => MenuModal(onClose: onClose),
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
