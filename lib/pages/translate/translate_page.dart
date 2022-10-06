import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/translate/translate_store.dart';
import 'package:translate/pages/translate/widgets/translate_text.dart';
import 'package:translate/theming/app_icons.dart';
import 'package:translate/theming/app_theme.dart';

import 'widgets/pages_widget.dart';
import 'widgets/theme_mode_switch.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({Key? key}) : super(key: key);

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Provider<TranslateStore>(
      create: (_) => TranslateStore(),
      builder: (context, child) {
        final store = context.read<TranslateStore>();
        return Observer(builder: (context) {
          if (!store.isLoading) {
            return Scaffold(
              body: ListView(
                controller: scrollController,
                children: [
                  Text(
                    store.title,
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
                  const Center(child: PagesWidget()),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: AppInsets.s24,
                      left: AppInsets.s64,
                      right: AppInsets.s64,
                      bottom: AppInsets.s24,
                    ),
                    child: TranslateText(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppInsets.s24),
                    child: Center(
                      child: PagesWidget(
                        scrollTop: () => scrollController.jumpTo(0),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
      },
    );
  }
}
