part of 'app_theme.dart';

abstract class AppTextTheme {
  static const light = TextTheme(
    headline1: TextStyle(
      fontFamily: AppFonts.inter,
      fontWeight: FontWeight.w800,
      fontSize: 56,
      color: AppColors.black,
    ),
  );
  static const dark = TextTheme(
    headline1: TextStyle(
      fontFamily: AppFonts.inter,
      fontWeight: FontWeight.w800,
      fontSize: 56,
      color: AppColors.white,
    ),
  );
}
