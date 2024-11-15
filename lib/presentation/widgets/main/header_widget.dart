// lib/presentation/widgets/main/header_widget.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/widgets/common/hover_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.onProfileTap,
  });
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildSearchField(),
        ),
        const SizedBox(width: 12),
        _buildHomeButton(),
        const SizedBox(width: 12),
        _buildProfileButton(),
      ],
    );
  }

  Widget _buildSearchField() {
    return HoverWidget(
      builder: (isHovered) => TextFormField(
        style: const TextStyle(color: primaryTextColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 12.0, right: 8.0),
            child: Icon(Icons.search, color: primaryTextColor),
          ),
          hintText: 'What do you want to play?',
          hintStyle: const TextStyle(color: primaryTextColor),
          border: _buildSearchBorder(isHovered: isHovered),
          focusedBorder: _buildSearchBorder(isHovered: true),
          enabledBorder: _buildSearchBorder(isHovered: isHovered),
        ),
      ),
    );
  }

  OutlineInputBorder _buildSearchBorder({bool isHovered = false}) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: isHovered ? secondaryColor : primaryTextColor,
      ),
    );
  }

  Widget _buildHomeButton() {
    return CircleAvatar(
      backgroundColor: primaryTextColor,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.home,
          color: primaryColor,
        ),
      ),
    );
  }

  Widget _buildProfileButton() {
    return Material(
      shape: const CircleBorder(),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onProfileTap,
        child: CircleAvatar(
          backgroundColor: primaryTextColor,
          child: Icon(
            Icons.person,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
