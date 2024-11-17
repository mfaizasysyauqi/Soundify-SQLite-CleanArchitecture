// lib/presentation/widgets/collection/collection_header.dart
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:soundify/core/styles/text_styles.dart';

class CollectionHeader extends StatelessWidget {
  final String title;
  final String description;
  final IconData headerIcon;
  final Color iconColor;
  final Color containerColor;
  final String creatorName;
  final bool isMediumScreen;
  final VoidCallback onMorePressed;
  final Function(BuildContext, String) onDescriptionTap;

  const CollectionHeader({
    super.key,
    required this.title,
    required this.description,
    required this.headerIcon,
    required this.iconColor,
    required this.containerColor,
    required this.creatorName,
    required this.isMediumScreen,
    required this.onMorePressed,
    required this.onDescriptionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeaderImage(),
        SizedBox(width: isMediumScreen ? 16 : 8),
        Expanded(
          child: _buildHeaderContent(context),
        ),
        _buildMoreButton(),
      ],
    );
  }

  Widget _buildHeaderImage() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: containerColor,
          ),
          child: Icon(
            headerIcon,
            color: iconColor,
            size: 70,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        Text(
          creatorName,
          style: const TextStyle(
            color: quaternaryTextColor,
            fontWeight: fontWeightMedium,
            fontSize: microFontSize,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: isMediumScreen ? 50 : 30,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: 4),
        _buildDescription(context),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return IntrinsicWidth(
      child: RichText(
        text: TextSpan(
          text: description,
          style: TextStyle(
            color: quaternaryTextColor,
            fontWeight: fontWeightMedium,
            fontSize: isMediumScreen ? 14 : 12,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () => onDescriptionTap(context, creatorName),
        ),
        maxLines: isMediumScreen ? 2 : 4,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildMoreButton() {
    return IconButton(
      icon: const Icon(Icons.more_horiz, color: Colors.white),
      onPressed: onMorePressed,
    );
  }
}
