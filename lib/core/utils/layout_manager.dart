// lib/core/utils/layout_manager.dart
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

enum ScreenSize { mobile, tablet, desktop }

class LayoutManager {
  static ScreenSize getScreenSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width >= LayoutBreakpoints.desktop) return ScreenSize.desktop;
    if (width >= LayoutBreakpoints.tablet) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }

  static bool shouldShowSecondaryContainer(BuildContext context) {
    return MediaQuery.of(context).size.width >= LayoutBreakpoints.tablet;
  }
}
