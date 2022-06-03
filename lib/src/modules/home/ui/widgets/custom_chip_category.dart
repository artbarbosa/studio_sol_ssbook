import 'package:flutter/material.dart';

import '../../../../core/shared/consts/app_colors_const.dart';
import '../../../../core/shared/consts/app_text_styles_const.dart';

class CustomChipCategory extends StatelessWidget {
  const CustomChipCategory(
      {Key? key, required this.isSelected, required this.label})
      : super(key: key);
  final bool isSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor:
          isSelected ? AppColorsConst.primary : AppColorsConst.onPrimary,
      label: Text(
        label,
        style: isSelected
            ? AppTextStylesConst.categoryBookHomeSelected
            : AppTextStylesConst.categoryBookHome,
      ),
    );
  }
}
