// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:translate/pages/translate_store.dart';
// import 'package:translate/pages/widgets/theme_mode_switch.dart';
// import 'package:translate/theming/app_icons.dart';
// import 'package:translate/theming/app_theme.dart';
//
// class TranslatePage extends StatefulWidget {
//   const TranslatePage({Key? key}) : super(key: key);
//
//   @override
//   State<TranslatePage> createState() => _TranslatePageState();
// }
//
// class _TranslatePageState extends State<TranslatePage> {
//   TranslateStore store = TranslateStore();
//   bool _isUILoading = true;
//   List<TextSpan> spans = [];
//   ScrollController scrollController = ScrollController();
//   List<RichText> list = [];
//
//   void makeTextClickable(String text) {
//     text.splitMapJoin(
//       RegExp('\\w+'),
//       onMatch: (m) {
//         final matchStr = m.group(0);
//         spans.add(
//           TextSpan(
//             // recognizer: TapGestureRecognizer()..onTap = () => print(matchStr),
//             text: matchStr,
//           ),
//         );
//         return matchStr ?? '';
//       },
//       onNonMatch: (string) {
//         spans.add(TextSpan(
//           text: string,
//         ));
//         return string;
//       },
//     );
//     _isUILoading = false;
//   }
//
//   void setupScrollController(BuildContext context) {
//     scrollController.addListener(() {
//       if (scrollController.position.atEdge) {
//         if (scrollController.position.pixels != 0) {
//           Widget widget() {
//             return RichText(
//               text: TextSpan(
//                 children: spans,
//                 style: Theme.of(context).textTheme.caption,
//               ),
//             );
//           }
//           store.nextString();
//         }
//       }
//       print(scrollController.position.pixels);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     setupScrollController(context);
//     // bool isLoading = false;
//     return Observer(builder: (context) {
//       if (!store.isLoading) {
//         return Scaffold(
//           body: Column(
//             children: [
//               Text(
//                 store.title,
//                 style: Theme.of(context).textTheme.headline1,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: AppInsets.s24),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: AppInsets.s8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(AppIcons.moon, color: AppColors.grey),
//                     const SizedBox(width: AppInsets.s16),
//                     const ThemeModeSwitch(),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(
//                   vertical: AppInsets.s32,
//                   horizontal: AppInsets.s64,
//                 ),
//                 child: Divider(),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   padding: const EdgeInsets.only(
//                     left: AppInsets.s64,
//                     right: AppInsets.s64,
//                     bottom: AppInsets.s64,
//                   ),
//                   controller: scrollController,
//                   itemBuilder: (context, index) {
//                     return Container();
//                     //   if (index < list.length) {
//                     //     return list[index];
//                     //   } else {
//                     //     Timer(const Duration(milliseconds: 30), () {
//                     //       scrollController
//                     //           .jumpTo(scrollController.position.maxScrollExtent);
//                     //     });
//                     //     return _loadingIndicator();
//                     //   }
//                   },
//                   itemCount: list.length ,//+ (isLoading ? 1 : 0),
//                 ),
//               ),
//             ],
//           ),
//         );
//         // } else if (!store.isLoading) {
//         // makeTextClickable(store.text);
//       }
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     });
//   }
//
//   Widget _loadingIndicator() {
//     return const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// //
//
// }
