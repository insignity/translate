import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:translate/theming/app_theme.dart';
import 'package:translate/theming/theme_provider.dart';

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return FlutterSwitch(
      height: 25,
      width: 50,
      padding: 2,
      value: themeProvider.isDarkMode,
      onToggle: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
      toggleSize: 15,
      inactiveColor: AppColors.transparent,
      activeColor: AppColors.transparent,
      toggleColor: AppColors.blue,
      switchBorder: Border.all(color: AppColors.blue, width: 2),

    );
  }
}
