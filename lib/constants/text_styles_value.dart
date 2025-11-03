// lib/constants/text_style_values.dart

import 'package:flutter/material.dart';
import 'package:lab7/constants/colors.dart';

class AppTextStyles {
  static final TextStyle px12blue = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
    fontSize: 12,
  );

  static final TextStyle superSmall = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.lightGreyColor,
    fontSize: 11,
  );

  static final TextStyle px10blue = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
    color: AppColors.azure,
    fontSize: 10,
  );
}
