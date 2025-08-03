import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:periodic_table/core/constants/app_colors.dart';
import 'package:periodic_table/core/utills/image_description.dart';

class ImageSection extends StatelessWidget {
  final String imageUrl;
  final String imageTitle;
  const ImageSection({
    super.key,
    required this.imageUrl,
    required this.imageTitle,
  });

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    // Check if screen is too narrow
    final bool forceLandscape = screen.width < 500;
    return Column(
      spacing: 10,
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: forceLandscape ? screen.height * 0.20 : screen.width * 0.15,
        ),
        AutoSizeText(
          imageDescriptionTrim(imageTitle),
          minFontSize: 8,
          maxFontSize: 12,
          style: TextStyle(
            color: AppColors.dialogGeneralTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
