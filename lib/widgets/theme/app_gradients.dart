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

  static const searchAppLinearGradient = LinearGradient(
    colors: <Color>[
      Colors.white,
      // AppColors.themeColor,
      Color.fromARGB(0, 255, 255, 255),
      // Color(0x00032541),
    ],
    begin: Alignment.center,
    end: Alignment.bottomCenter,
    // stops: [0.4, 1.0],
  );

  static const movieTopPosterAppLinearGradient = LinearGradient(
      colors: <Color>[
        AppColors.themeColor,
        AppColors.themeColorTransparent,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [0.2, 0.5]);
}
