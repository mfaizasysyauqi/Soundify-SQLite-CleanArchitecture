// lib/presentation/screens/app/primary/add/add_song_screen.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/widgets/common/hover_form_field.dart';

class AddSongScreen extends StatefulWidget {
  final Function(Widget) onChangeWidget;

  const AddSongScreen({
    super.key,
    required this.onChangeWidget,
  });
  
  @override
  AddSongWidgetState createState() => AddSongWidgetState();
}

class AddSongWidgetState extends State<AddSongScreen> {
  final TextEditingController _songFileNameController = TextEditingController();
  final TextEditingController _songImageFileNameController =
      TextEditingController();
  final TextEditingController _songTitleController = TextEditingController();
  final TextEditingController _albumIdController = TextEditingController();
  final TextEditingController _artistIdController = TextEditingController();

  final bool _isSongSelected = false;
  final bool _isImageSelected = false;
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HoverFormField(
                controller: _songFileNameController,
                hintText: 'Song File Name',
                icon: Icons.music_note,
                readOnly: true,
                suffixIcon: _isSongSelected
                    ? IconButton(
                        onPressed: () {
                          setState(() => _isPlaying = !_isPlaying);
                        },
                        icon: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          color: primaryTextColor,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 8),
              HoverFormField(
                controller: _songImageFileNameController,
                hintText: 'Image File Name',
                icon: Icons.image,
                readOnly: true,
                suffixIcon: _isImageSelected
                    ? IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.visibility,
                          color: primaryTextColor,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 8),
              HoverFormField(
                controller: _artistIdController,
                hintText: 'Artist ID',
                icon: Icons.person,
                readOnly: true,
              ),
              const SizedBox(height: 8),
              HoverFormField(
                controller: _albumIdController,
                hintText: 'Album ID',
                icon: Icons.album,
                readOnly: true,
              ),
              const SizedBox(height: 8),
              HoverFormField(
                controller: _songTitleController,
                hintText: 'Song Title',
                icon: Icons.headset,
              ),
              const Spacer(),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return MouseRegion(
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: quinaryColor,
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              child: Text(
                "Submit",
                style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
