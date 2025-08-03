import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:periodic_table/core/constants/app_colors.dart';

class ElementStyle extends Equatable {
  final Color backgroundColor;
  final Color textColor;
  final Color subTextColor;

  const ElementStyle(
    this.backgroundColor,
    this.textColor, {
    this.subTextColor = AppColors.customWhite,
  });

  @override
  List<Object?> get props => [];
}

ElementStyle getElementStyle(String? category) {
  switch (category?.toLowerCase()) {
    case 'alkali metal':
      return ElementStyle(AppColors.customBrown, AppColors.customWhite);

    case 'alkaline earth metal':
      return ElementStyle(AppColors.customBlack, AppColors.customBrown);

    case 'polyatomic nonmetal':
    case 'diatomic nonmetal':
    case 'metalloid':
      return ElementStyle(AppColors.customBlack, AppColors.customWhite);

    case 'transition metal':
      return ElementStyle(
        AppColors.customBrown,
        AppColors.transitionMetalTextColor,
      );

    case 'post-transition metal':
      return ElementStyle(
        AppColors.customWhite,
        AppColors.customBrown,
        subTextColor: AppColors.blackText,
      );

    // case 'polyatomic nonmetal':
    //   return ElementStyle(AppColors.nonMetals, AppColors.diagramOutline);

    case 'noble gas':
      return ElementStyle(
        AppColors.customWhite,
        AppColors.customBlack,
        subTextColor: AppColors.blackText,
      );

    default:
      return ElementStyle(Colors.transparent, AppColors.customWhite);
  }
}
