import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:periodic_table/core/constants/app_colors.dart';

class DetailsRow extends StatelessWidget {
  final String name;
  final String value;
  const DetailsRow({super.key, required this.name, required this.value});

  final Color textColor = AppColors.customWhite;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 33, 18, 11),
      padding: EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            name,
            minFontSize: 5,
            style: TextStyle(overflow: TextOverflow.ellipsis, color: textColor),
          ),
          Spacer(),
          SizedBox(
            width: 100,
            child: AutoSizeText(
              value,
              minFontSize: 6,
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12,
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
