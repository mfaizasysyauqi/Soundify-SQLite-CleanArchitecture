// lib/presentation/widgets/secondary/song_detail_widget.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';

class SongDetailWidget extends StatelessWidget {
  const SongDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: constraints.maxHeight,
            color: primaryColor,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SongCover(),
                  SongDetailWidgetHeader(screenWidth: screenWidth),
                  ArtistInfoCard(screenWidth: screenWidth),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Komponen-komponen pendukung bisa dibuat dalam file yang sama
class SongCover extends StatelessWidget {
  const SongCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
        bottom: 8.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            color: senaryColor,
            child: const Icon(Icons.music_note, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SongDetailWidgetHeader extends StatelessWidget {
  final double screenWidth;

  const SongDetailWidgetHeader({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.8,
            child: const Text(
              'Song Title',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: primaryTextColor,
                fontWeight: FontWeight.bold,
                fontSize: hugeFontSize,
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.8,
            child: const Text(
              'Artist Name',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: quaternaryTextColor,
                fontSize: smallFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArtistInfoCard extends StatelessWidget {
  final double screenWidth;

  const ArtistInfoCard({
    super.key,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: screenWidth,
          color: tertiaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: primaryTextColor,
                  child: Icon(
                    Icons.person,
                    color: primaryColor,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Artist Name',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                RichText(
                  text: const TextSpan(
                    text: "User bio",
                    style: TextStyle(
                      color: quaternaryTextColor,
                      fontWeight: mediumWeight,
                      fontSize: microFontSize,
                    ),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
