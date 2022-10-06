import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/translate/translate_store.dart';

class PagesWidget extends StatelessWidget {
  final VoidCallback? scrollTop;

  const PagesWidget({Key? key, this.scrollTop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TranslateStore store = Provider.of<TranslateStore>(context);
    return Observer(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: store.page == 0
                ? null
                : () {
                    if (scrollTop != null) scrollTop!();
                    store.page--;
                  },
            icon: const Icon(Icons.chevron_left),
          ),
          Text(
            "${store.page + 1}/${store.lastPage}",
            style: Theme.of(context).textTheme.caption,
          ),
          IconButton(
            onPressed: store.page + 1 == store.lastPage
                ? null
                : () {
                    if (scrollTop != null) scrollTop!();
                    store.page++;
                  },
            icon: const Icon(Icons.chevron_right),
          ),
        ],
      );
    });
  }
}
