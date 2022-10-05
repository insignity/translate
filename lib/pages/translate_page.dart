import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/translate_store.dart';
import 'package:translate/pages/widgets/theme_mode_switch.dart';
import 'package:translate/theming/app_icons.dart';
import 'package:translate/theming/app_theme.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({Key? key}) : super(key: key);

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  void makeTextClickable(List<TextSpan> spans, String text) {
    text.splitMapJoin(
      RegExp('\\w+'),
      onMatch: (m) {
        final matchStr = m.group(0);

        spans.add(TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => print(matchStr),
            text: matchStr,
            style: TextStyle(
                background: Paint()..color = Colors.blue.withOpacity(0.4))));
        return matchStr ?? '';
      },
      onNonMatch: (string) {
        spans.add(TextSpan(
          text: string,
        ));
        return string;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TranslateStore store = TranslateStore();
    List<TextSpan> spans = [];

    return Observer(builder: (context) {
      if (store.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        makeTextClickable(spans, store.text);

        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'store.title',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppInsets.s24),
              Padding(
                padding: const EdgeInsets.only(bottom: AppInsets.s8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.moon, color: AppColors.grey),
                    const SizedBox(width: AppInsets.s16),
                    const ThemeModeSwitch(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppInsets.s32,
                  horizontal: AppInsets.s64,
                ),
                child: Divider(),
              ),
            ],
          ),
        );
      }
    });
  }
}
