import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/theme/app_text_style.dart';

import 'app_colors.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(AppColors.activeColor),
    textStyle: MaterialStateProperty.all(AppTextStyle.linkButtonTextStyle),
    padding: MaterialStateProperty.all(EdgeInsets.zero),
  );

  static final ButtonStyle defaultButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.activeColor),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.all(AppColors.postActiveColor),
    padding:
        MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 20)),
    textStyle: MaterialStateProperty.all(AppTextStyle.defaultButtonTextStyle),
  );
}
