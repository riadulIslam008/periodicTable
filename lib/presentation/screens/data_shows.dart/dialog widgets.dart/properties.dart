
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:periodic_table/core/constants/app_colors.dart';

class Properties extends StatelessWidget {
  final String title;
  final String properties;
  const Properties({
    super.key,
    required this.title,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SizedBox(
          width: 40,
          height: 20,
          child: AutoSizeText(
            overflow: TextOverflow.ellipsis,
            title,
            minFontSize: 8,
            maxLines: 2,
            style: TextStyle(fontSize: 10, color: AppColors.customWhite),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.shadow),
          ),
          child: Container(
            padding: EdgeInsets.all(6),
            alignment: Alignment.center,
            height: 45,
            width: 45,
            // color: AppColors.diatomicNonmetalBackground,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.dialogTextColor),
            ),
            child: Center(
              child: AutoSizeText(
                textAlign: TextAlign.justify,
                minFontSize: 7,
                maxLines: 2,
                properties,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.dialogGeneralTextColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
