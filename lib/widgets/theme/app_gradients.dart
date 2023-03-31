import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppGradients {
  static const defaultAppLinearGradient = LinearGradient(
    colors: <Color>[
      AppColors.firstDefaultGradientColor,
      AppColors.secondDefaultGradientColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const greyAppLinearGradient = LinearGradient(
    colors: <Color>[
      AppColors.firstGreyGradientColor,
      AppColors.secondGreyGradientColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
