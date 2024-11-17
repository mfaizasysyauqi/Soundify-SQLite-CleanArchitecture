// lib/presentation/widgets/main/menu_modal.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/providers/primary_widget_state_provider.dart';
import 'package:soundify/presentation/screens/app/primary/add/add_song_screen.dart';

class MenuModal extends StatelessWidget {
  final VoidCallback onClose;

  const MenuModal({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildModalBackground(),
        _buildModalContent(context),
      ],
    );
  }

  Widget _buildModalBackground() {
    return Positioned.fill(
      child: GestureDetector(
        onTap: onClose,
        child: Container(color: Colors.transparent),
      ),
    );
  }

  Widget _buildModalContent(BuildContext context) {
    return Positioned(
      left: 12,
      top: 120,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
          decoration: BoxDecoration(
            color: tertiaryColor,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildMenuItem(
                context: context,
                icon: Icons.playlist_add,
                text: "Create Playlist",
                onTap: () {
                  // Handle Create Playlist
                  onClose();
                },
              ),
              _buildMenuItem(
                context: context,
                icon: Icons.add,
                text: "Add Song",
                onTap: () {
                  Provider.of<PrimaryWidgetStateProvider>(context, listen: false)
                      .changeWidget(
                    AddSongScreen(
                      onChangeWidget: (widget) {
                        Provider.of<PrimaryWidgetStateProvider>(context, listen: false)
                            .changeWidget(widget, 'NewWidget');
                      },
                    ),
                    'AddSongScreen',
                  );
                  onClose();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return IntrinsicWidth(
      child: TextButton(
        onPressed: onTap,
        child: Row(
          children: [
            Icon(icon, color: primaryTextColor),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: smallFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
