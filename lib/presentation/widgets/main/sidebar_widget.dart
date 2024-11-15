// lib/presentation/widgets/main/sidebar_widget.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

class SidebarWidget extends StatelessWidget {
  final Function(BuildContext) onShowModal; // Updated type definition

  const SidebarWidget({
    super.key,
    required this.onShowModal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        children: [
          _buildLogo(),
          Expanded(
            child: _buildSidebarContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 18.0),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Soundify",
          style: TextStyle(
            color: secondaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 155,
      child: Column(
        children: [
          _buildMenuHeader(context),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(color: primaryTextColor),
          ),
          Expanded(
            child: _buildPlaylistSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuHeader(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, top: 10, bottom: 3.0),
      child: Row(
        children: [
          InkWell(
            onTap: () => onShowModal(context),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () => onShowModal(context),
            child: const Icon(
              Icons.add,
              color: primaryTextColor,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaylistSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                color: primaryColor,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        width: 35,
                        height: 35,
                        color: secondaryColor,
                        child: Icon(
                          Icons.favorite,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Liked Songs',
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: smallFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
