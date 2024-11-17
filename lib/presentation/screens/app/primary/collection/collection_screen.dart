// lib/presentation/screens/app/primary/collection/collection_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/presentation/managers/modal_manager.dart';
import 'package:soundify/presentation/providers/widget_size_provider.dart';
import 'package:soundify/presentation/widgets/collection/collection_header.dart';
import 'package:soundify/presentation/widgets/collection/collection_table_header.dart';
import 'package:soundify/presentation/widgets/common/sticky_header_delegate.dart';

class CollectionScreen extends StatefulWidget {
  final String title;
  final String description;
  final IconData headerIcon;
  final Color iconColor;
  final Color containerColor;
  final String creatorName;
  final List<TableColumnConfig> tableColumns;
  final Widget contentWidget;

  const CollectionScreen({
    super.key,
    required this.title,
    required this.description,
    required this.headerIcon,
    required this.iconColor,
    required this.containerColor,
    required this.creatorName,
    required this.tableColumns,
    required this.contentWidget,
  });

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final ModalManager _modalManager = ModalManager();

  @override
  void dispose() {
    _modalManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and set minimum content width
    double screenWidth = MediaQuery.of(context).size.width;
    double minContentWidth = 360;
    
    // Get provided width from WidgetSizeProvider
    double providedMaxWidth = Provider.of<WidgetSizeProvider>(context).expandedWidth;
    double adjustedMaxWidth = providedMaxWidth.clamp(minContentWidth, double.infinity);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMediumScreen = constraints.maxWidth >= 800;

        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: minContentWidth,
                  maxWidth: screenWidth.clamp(minContentWidth, adjustedMaxWidth),
                ),
                child: _buildNestedScrollView(isMediumScreen, screenWidth),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNestedScrollView(bool isMediumScreen, double screenWidth) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: CollectionHeader(
            title: widget.title,
            description: widget.description,
            headerIcon: widget.headerIcon,
            iconColor: widget.iconColor,
            containerColor: widget.containerColor,
            creatorName: widget.creatorName,
            isMediumScreen: isMediumScreen,
            onMorePressed: _handleMorePressed,
            onDescriptionTap: _showDescriptionModal,
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyHeaderDelegate(
            child: CollectionTableHeader(
              screenWidth: screenWidth,
              columns: widget.tableColumns,
            ),
          ),
        ),
      ],
      body: widget.contentWidget,
    );
  }

  void _handleMorePressed() {
    // Handle more button press
  }

  void _showDescriptionModal(BuildContext context, String creatorName) {
    _modalManager.showDescriptionModal(
      context,
      title: widget.title,
      subtitle: widget.creatorName,
      content: widget.description,
      icon: widget.headerIcon,
      iconColor: widget.iconColor,
      containerColor: widget.containerColor,
    );
  }
}