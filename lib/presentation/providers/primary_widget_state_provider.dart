// lib/presentation/providers/primary_widget_state_provider.dart
import 'package:flutter/material.dart';

// Model untuk Provider
class PrimaryWidgetStateProvider with ChangeNotifier {
  Widget _activePrimaryWidget =  Container(); // Default widget
  String _primaryWidgetName = 'HomeScreen'; // Nama widget untuk melacak

  // Getter untuk mendapatkan widget saat ini
  Widget get currentWidget => _activePrimaryWidget;
  String get primaryWidgetName => _primaryWidgetName;

  // Fungsi untuk mengubah widget dan melacak namanya
  void changeWidget(Widget newWidget, String name) {
    _activePrimaryWidget = newWidget;
    _primaryWidgetName = name;
    
    notifyListeners(); // Notify listeners immediately after the widget is changed
  }
}
