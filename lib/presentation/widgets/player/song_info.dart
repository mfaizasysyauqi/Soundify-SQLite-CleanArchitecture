// lib/presentation/widgets/player/song_info.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/player_styles.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class SongInfo extends StatelessWidget {
  final BoxConstraints constraints;

  const SongInfo({
    super.key,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PlayerStyles.bottomPadding), // Tambah padding bottom
      child: Container(
        width: constraints.maxWidth * 0.3,
        height: 50,
        color: quaternaryColor,
        child: Row(
          children: [
            const SizedBox(width: 16),
            _buildSongImage(),
            const SizedBox(width: 10),
            Expanded(child: _buildSongDetails()),
          ],
        ),
      ),
    );
  }

  Widget _buildSongImage() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          color: senaryColor,
          child: const Icon(Icons.music_note, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSongDetails() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Song Title',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: primaryTextColor, fontSize: smallFontSize),
        ),
        Text(
          'Artist Name',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: quaternaryTextColor, fontSize: microFontSize),
        ),
      ],
    );
  }
}
