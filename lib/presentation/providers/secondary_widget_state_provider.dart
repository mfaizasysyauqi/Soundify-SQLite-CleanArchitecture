// lib/presentation/providers/secondary_widget_state_provider.dart
import 'package:flutter/material.dart';
import 'package:soundify/presentation/widgets/secondary/song_detail.dart';

// Model untuk Provider
class SecondaryWidgetStateProvider with ChangeNotifier {
  Widget _activeSecondaryWidget = const SongDetail(); // Default widget
  String _secondaryWidgetName = 'SongInfo'; // Nama widget untuk melacak

  // Getter untuk mendapatkan widget saat ini
  Widget get currentWidget => _activeSecondaryWidget;
  String get secondaryWidgetName => _secondaryWidgetName;

  // Fungsi untuk mengubah widget dan melacak namanya
  void changeWidget(Widget newWidget, String name) {
    _activeSecondaryWidget = newWidget;
    _secondaryWidgetName = name; // Simpan nama widget
    notifyListeners(); // Memberitahu Consumer tentang perubahan
  }
}
