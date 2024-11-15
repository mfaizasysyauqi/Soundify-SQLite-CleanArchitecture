// lib/presentation/screens/main_screen.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/managers/modal_manager.dart';
import 'package:soundify/presentation/widgets/player/footer_widget.dart';
import 'package:soundify/presentation/widgets/main/header_widget.dart';
import 'package:soundify/presentation/widgets/main/main_content.dart';
import 'package:soundify/presentation/widgets/main/sidebar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ModalManager _modalManager = ModalManager();

  @override
  void dispose() {
    _modalManager.dispose();
    super.dispose();
  }

  void _showModal(BuildContext context) {
    _modalManager.showModal(context, () => _modalManager.closeModal());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryTextColor,
        body: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: SidebarWidget(
                      onShowModal: (BuildContext ctx) =>
                          _showModal(ctx), // Updated callback
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          HeaderWidget(
                            onProfileTap: () => {},
                          ),
                          const Expanded(
                            child: MainContent(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
