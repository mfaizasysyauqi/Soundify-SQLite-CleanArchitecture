// lib/presentation/providers/widget_size_provider.dart
import 'package:flutter/material.dart';

class WidgetSizeProvider extends ChangeNotifier {
  double _expandedWidth = 0;
  Widget _currentWidget = Container();

  double get expandedWidth => _expandedWidth;
  Widget get currentWidget => _currentWidget;

  void updateExpandedWidth(double width) {
    _expandedWidth = width;
    notifyListeners();
  }

  void updateCurrentWidget(Widget widget) {
    _currentWidget = widget;
    notifyListeners();
  }
}