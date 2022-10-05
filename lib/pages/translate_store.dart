import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:logger/logger.dart';

part 'translate_store.g.dart';

class TranslateStore = _TranslateStore with _$TranslateStore;

abstract class _TranslateStore with Store {
  _TranslateStore() {
    // readJson();
  }

  @readonly
  bool _isLoading = false;

  @readonly
  String _text = '';

  @readonly
  String _title = '';

  Future<void> readJson() async {
    _isLoading = true;
    try {
      final String response = await rootBundle.loadString('assets/sample.json');
      final data = await json.decode(response);
      Logger().i(data);
      _text = data['text'];
      _title = data['text_name'];
      _isLoading = false;
    } catch (e) {
      Logger().i(e);
    }
  }
}
