// lib/presentation/providers/secondary_widget_state_provider.dart
import 'package:flutter/material.dart';
import 'package:soundify/presentation/screens/app/secondary/song_detail/song_detail_screen.dart';

class SecondaryWidgetStateProvider with ChangeNotifier {
  Widget _activeSecondaryWidget = const SongDetailScreen(); // Default widget
  String _secondaryWidgetName = 'SongDetailScreen'; // Nama widget untuk melacak

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
