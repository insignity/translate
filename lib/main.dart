import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/translate/translate_page.dart';
import 'package:translate/theming/app_theme.dart';
import 'service_locator.dart' as di;

import 'theming/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: const SafeArea(child: TranslatePage()),
        );
      },
    );
  }
}
