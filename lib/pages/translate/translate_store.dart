import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:translate/service_locator.dart';

part 'translate_store.g.dart';

class TranslateStore = _TranslateStore with _$TranslateStore;

abstract class _TranslateStore with Store {
  _TranslateStore() {
    init();
  }

  final List<String> _list = [];
  String _text = '';

  Future init() async {
    _isLoading = true;
    try {
      await _readJson();
      await _splitText(_text);
    } catch (e) {
      logger.e(e);
    }
    _isLoading = false;
  }

  Future<void> _readJson() async {
    try {
      final response = await rootBundle.loadString('assets/sample.json');
      final data = await json.decode(response);
      _title = data['text_name'];
      _text = data['text'];
      logger.i(_text);
    } catch (e) {
      logger.i(e);
    }
  }

  Future<void> _splitText(String text) async {
    for (int i = 0; i < text.length / 2000; i++) {
      int lastIndex = (i + 1) * 2000 - 1;
      if (text.length < lastIndex) lastIndex = text.length;
      _list.add(text.substring(i * 2000, lastIndex));
    }
  }

  @readonly
  bool _isLoading = true;

  @readonly
  String _title = '';

  @computed
  int get lastPage => _list.length;

  @observable
  int page = 0;

  @action
  String? nextString(int page) {
    return _list[page];
  }
}
