// lib/presentation/screens/app/primary/liked/liked_song_screen.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/screens/app/primary/collection/collection_screen.dart';
import 'package:soundify/presentation/widgets/collection/collection_table_header.dart';
import 'package:soundify/presentation/widgets/song/song_list.dart';

class LikedSongScreen extends StatelessWidget {
  const LikedSongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CollectionScreen(
      title: 'Liked Songs',
      description: 'Collection of all your favorite songs',
      creatorName: 'Creator Name',
      headerIcon: Icons.favorite,
      iconColor: primaryColor,
      containerColor: senaryColor,
      tableColumns: _getLikedSongColumns(),
      contentWidget: const SongList(),
    );
  }

  List<TableColumnConfig> _getLikedSongColumns() {
    return [
      const TableColumnConfig(
        title: '#',
        width: FixedColumnWidth(50),
        showAtWidth: 0,
      ),
      const TableColumnConfig(
        title: 'Title',
        width: FlexColumnWidth(2),
        showAtWidth: 0,
      ),
      const TableColumnConfig(
        title: 'Album',
        width: FlexColumnWidth(2),
        showAtWidth: 1280,
      ),
      const TableColumnConfig(
        title: 'Date Added',
        width: FlexColumnWidth(2),
        showAtWidth: 1480,
      ),
      TableColumnConfig(
        title: '',
        width: const FixedColumnWidth(168),
        showAtWidth: 0,
        builder: () => const Icon(
          Icons.access_time,
          color: primaryTextColor,
        ),
      ),
    ];
  }
}
