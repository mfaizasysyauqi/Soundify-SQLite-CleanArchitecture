// lib/presentation/widgets/main/main_content.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundify/presentation/providers/primary_widget_state_provider.dart';
import 'package:soundify/presentation/providers/secondary_widget_state_provider.dart';
import 'package:soundify/presentation/providers/widget_size_provider.dart';
import '../../../core/styles/colors.dart';
import '../../../core/utils/layout_manager.dart';
import '../../../core/constants/app_constants.dart';

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
        right: 2.0,
        top: 12,
        bottom: 0,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildPrimaryContainer(context),
          ),
          if (LayoutManager.shouldShowSecondaryContainer(context)) ...[
            const SizedBox(width: 12),
            _buildSecondaryContainer(context),
          ],
        ],
      ),
    );
  }

  Widget _buildPrimaryContainer(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Provider.of<WidgetSizeProvider>(
            context,
            listen: false,
          ).updateExpandedWidth(constraints.maxWidth);
        });

        return Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Consumer2<WidgetSizeProvider, PrimaryWidgetStateProvider>(
            builder: (context, widgetSizeProvider, primaryWidgetStateProvider, child) {
              return primaryWidgetStateProvider.currentWidget;
            },
          ),
        );
      },
    );
  }

  Widget _buildSecondaryContainer(BuildContext context) {
    return Flexible(
      flex: MediaQuery.of(context).size.width <= LayoutBreakpoints.desktop
          ? 1
          : 0,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: LayoutBreakpoints.maxSecondaryContainerWidth,
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Consumer<SecondaryWidgetStateProvider>(
          builder: (context, secondaryWidgetStateProvider, child) {
            return secondaryWidgetStateProvider.currentWidget;
          },
        ),
      ),
    );
  }
}