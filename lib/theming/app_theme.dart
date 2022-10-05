import 'package:flutter/material.dart';

part 'app_colors.dart';
part 'app_insets.dart';
part 'app_text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    dividerTheme: appDividerTheme,
    colorScheme: const ColorScheme.light(),
    textTheme: AppTextTheme.light,
  );

  static final darkTheme = ThemeData(
    dividerTheme: appDividerTheme,
    scaffoldBackgroundColor: AppColors.dark,
    colorScheme: const ColorScheme.dark(),
    textTheme: AppTextTheme.dark,
  );
}

abstract class AppFonts {
  static const String inter = 'Inter';
}


DividerThemeData appDividerTheme = const DividerThemeData(
  thickness: 1.0,
  color: AppColors.grey20,
  indent: 0.0,
  space: 1.0,
);
