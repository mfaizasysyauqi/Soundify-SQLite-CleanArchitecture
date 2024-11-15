// lib/presentation/widgets/player/controls/play_pause_button.dart
import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPressed;

  const PlayPauseButton({
    super.key,
    required this.isPlaying,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: primaryTextColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: primaryColor,
          size: 28,
        ),
      ),
    );
  }
}
