import 'package:flutter/material.dart';
import 'package:periodic_table/core/constants/app_colors.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class LinearText extends StatelessWidget {
  const LinearText({super.key});

  @override
  Widget build(BuildContext context) {
    bool smallerScreen = MediaQuery.of(context).size.width < 650;
    return Center(
      child: GradientText(
        "PERIODIC TABLE",
        style: TextStyle(fontSize: smallerScreen ? 650/40 : 35),
        colors: [
          AppColors.gradientStart,
          AppColors.gradientMid,
          AppColors.gradientEnd,
        ],
      ),
    );
  }
}
