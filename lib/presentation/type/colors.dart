import 'package:flutter/material.dart';

enum AppColors {
  green(rawValue: 'green'),
  red(rawValue: 'red'),
  none(rawValue: 'red');

  const AppColors({required this.rawValue});

  final String rawValue;
}

extension AppColorsEnum on AppColors {
  static Color colors(AppColors color) {
    switch (color) {
      case AppColors.green:
        return Colors.green;
      case AppColors.red:
        return Colors.red;
      case AppColors.none:
        return Colors.black;
    }
  }
}
