// lib/presentation/widgets/player/footer_widget.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/player_styles.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/widgets/player/controls/play_pause_button.dart';
import 'package:soundify/presentation/widgets/player/controls/skip_button.dart';
import 'package:soundify/presentation/widgets/player/song_info.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  final double _currentPosition = 0.0;
  final double _currentVolume = 0.5;
  bool _isPlaying = false;
  final bool _isMuted = false;
  bool _isShuffleMode = false;
  bool _isRepeatMode = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: PlayerStyles.footerHeight,
          child: Row(
            children: [
              SongInfo(constraints: constraints),
              Expanded(
                child: _buildPlayerControls(constraints),
              ),
              _buildVolumeControls(constraints),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlayerControls(BoxConstraints constraints) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildShuffleButton(),
            const SizedBox(width: PlayerStyles.controlSpacing),
            SkipButton(
              icon: Icons.skip_previous,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PlayerStyles.controlSpacing,
              ),
              child: PlayPauseButton(
                isPlaying: _isPlaying,
                onPressed: () => setState(() => _isPlaying = !_isPlaying),
              ),
            ),
            SkipButton(
              icon: Icons.skip_next,
              onPressed: () {},
            ),
            const SizedBox(width: PlayerStyles.controlSpacing),
            _buildRepeatButton(),
          ],
        ),
        const SizedBox(height: 6),
        _buildProgressBar(constraints),
      ],
    );
  }

  void _toggleShuffleMode() async {
    setState(() {
      _isShuffleMode = !_isShuffleMode;
    });
  }

  void _toggleRepeatMode() async {
    setState(() {
      _isRepeatMode = !_isRepeatMode;
    });
  }

  Widget _buildShuffleButton() {
    return GestureDetector(
      onTap: _toggleShuffleMode,
      child: Icon(
        Icons.shuffle,
        color: _isShuffleMode ? secondaryColor : quaternaryTextColor,
        size: 24,
      ),
    );
  }

  Widget _buildRepeatButton() {
    return GestureDetector(
      onTap: _toggleRepeatMode,
      child: Icon(
        Icons.repeat,
        color: _isRepeatMode ? secondaryColor : quaternaryTextColor,
        size: 24,
      ),
    );
  }

  Widget _buildProgressBar(BoxConstraints constraints) {
    return Row(
      children: [
        SizedBox(width: constraints.maxWidth * 0.01),
        const Text(
          '00.00',
          style: TextStyle(color: quaternaryTextColor, fontSize: microFontSize),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3.7,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0),
              overlayShape: SliderComponentShape.noOverlay,
              activeTrackColor: primaryTextColor,
              inactiveTrackColor: tertiaryColor,
            ),
            child: Slider(
              value: _currentPosition,
              min: 0,
              max: 05.00,
              onChanged: (value) async {},
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          '01.00',
          style: TextStyle(color: quaternaryTextColor, fontSize: microFontSize),
        ),
        SizedBox(width: constraints.maxWidth * 0.01),
      ],
    );
  }

  Widget _buildVolumeControls(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.3,
      height: 50,
      color: quaternaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              _isMuted ? Icons.volume_off : Icons.volume_up,
              color: primaryTextColor,
              size: mediumFontSize,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: constraints.maxWidth *
                0.12, // Adjust this value to change the slider width
            child: _buildVolumeSlider(),
          ),
          const SizedBox(width: 8),
          Text(
            "${(_isMuted ? 0 : (_currentVolume * 100).toInt())}%",
            style: const TextStyle(
                color: primaryTextColor, fontSize: microFontSize),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildVolumeSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 2, // Make the track thinner
        thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 6), // Make the thumb smaller
        overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 12), // Make the overlay smaller
        activeTrackColor: primaryTextColor,
        inactiveTrackColor: tertiaryColor,
      ),
      child: Slider(
        value: _isMuted ? 0 : _currentVolume,
        min: 0,
        max: 1,
        label: "${(_currentVolume * 100).toInt()}%",
        onChanged: (value) async {},
        activeColor: Colors.white,
        inactiveColor: Colors.white.withOpacity(0.3),
      ),
    );
  }
}
