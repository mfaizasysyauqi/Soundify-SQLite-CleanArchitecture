// lib/presentation/providers/primary_widget_state_provider.dart
import 'package:flutter/material.dart';
import 'package:soundify/presentation/widgets/primary/home_widget.dart';

class PrimaryWidgetStateProvider with ChangeNotifier {
  Widget _activePrimaryWidget =  const HomeWidget(); // Default widget
  String _primaryWidgetName = 'HomeWidget'; // Nama widget untuk melacak

  // Getter untuk mendapatkan widget saat ini
  Widget get currentWidget => _activePrimaryWidget;
  String get primaryWidgetName => _primaryWidgetName;

  // Fungsi untuk mengubah widget dan melacak namanya
  void changeWidget(Widget newWidget, String name) {
    _activePrimaryWidget = newWidget;
    _primaryWidgetName = name;
    
    notifyListeners();
  }
}
