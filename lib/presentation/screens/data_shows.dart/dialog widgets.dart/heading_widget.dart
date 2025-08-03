import 'package:flutter/material.dart';
import 'package:periodic_table/core/constants/app_colors.dart';

class HeadingWidget extends StatelessWidget {
  final String heading;
  const HeadingWidget({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    // Check if screen is too narrow
    final bool forceLandscape = screen.width < 500;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: forceLandscape ? screen.height / 2 : screen.width / 2,
          child: Divider(
            thickness: 2,
            height: 10,
            indent: 2,
            endIndent: 2,
            color: AppColors.shadow,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: AppColors.customWhite,
          child: Text(
            heading.toUpperCase(),
            style: TextStyle(
              color: AppColors.dialogGeneralTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
