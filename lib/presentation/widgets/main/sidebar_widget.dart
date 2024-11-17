// lib/presentation/widgets/main/sidebar_widget.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/providers/primary_widget_state_provider.dart';
import 'package:soundify/presentation/screens/app/primary/home/home_screen.dart';
import 'package:soundify/presentation/screens/app/primary/liked/liked_song_screen.dart';

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
          _buildLogo(context), // Teruskan context ke method
          Expanded(
            child: _buildSidebarContent(context),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 18.0),
      child: TextButton(
        onPressed: () {
          Provider.of<PrimaryWidgetStateProvider>(context, listen: false)
              .changeWidget(
            const HomeScreen(),
            'HomeScreen',
          );
        },
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
          const SizedBox(
            height: 1,
          ),
          _buildMenuHeader(context),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(color: primaryTextColor),
          ),
          Expanded(
            child: _buildPlaylistSection(context),
          ),
          const SizedBox(
            height: 1,
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

  Widget _buildPlaylistSection(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                Provider.of<PrimaryWidgetStateProvider>(context, listen: false)
                    .changeWidget(
                  const LikedSongScreen(),
                  'LikedSongScreen',
                );
              },
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
                        color: senaryColor,
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
