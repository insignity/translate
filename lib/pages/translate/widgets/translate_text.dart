import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/translate/translate_store.dart';
import 'package:translate/theming/app_theme.dart';
import 'package:translator/translator.dart';

class TranslateText extends StatelessWidget {
  const TranslateText({Key? key}) : super(key: key);

  Future openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Container(
          height: 100,
          width: 100,
          color: AppColors.orange,
        ),
      );

  List<TextSpan> splitMapJoin(BuildContext context, String text) {
    final List<TextSpan> result = [];
    text.splitMapJoin(
      RegExp('\\w+'),
      onMatch: (m) {
        final matchStr = m.group(0);
        if (matchStr != null) {
          result.add(
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTapDown = (TapDownDetails details) {
                  final offsetDx = details.globalPosition.dx;
                  final offsetDy = details.globalPosition.dy;

                  GoogleTranslator()
                      .translate(matchStr, from: 'en', to: 'ru')
                      .then((value) {
                    showDialog(
                      context: context,
                      anchorPoint: Offset(offsetDx, offsetDy),
                      barrierColor: AppColors.grey20.withAlpha(100),
                      builder: (context) => Center(
                        child: _localDialogBuilder(context, value.text),
                      ),
                    );
                  });
                },
              text: matchStr,
            ),
          );
        }
        return matchStr ?? '';
      },
      onNonMatch: (string) {
        result.add(TextSpan(
          text: string,
        ));
        return string;
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final store = context.read<TranslateStore>();
    return Observer(builder: (context) {
      return RichText(
        text: TextSpan(
          children: splitMapJoin(context, store.nextString(store.page)!),
          style: Theme.of(context).textTheme.caption,
        ),
      );
    });
  }
}

Widget _localDialogBuilder(BuildContext context, String text) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppInsets.s24,
        vertical: AppInsets.s8,
      ),
      decoration: const BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption!.copyWith(
              color: AppColors.white,
            ),
      ),
    ),
  );
}
