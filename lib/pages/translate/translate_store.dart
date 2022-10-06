import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:translate/models/data.dart';
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

  @action
  Future<String> getTranslate(String text) async {
    final body = jsonEncode({"q": text,
      "target": "ru",
      "source": "en"});
    const uri =
        'https://deep-translate1.p.rapidapi.com/language/translate/v2';
    final result = await http.post(Uri.parse(uri),
        headers: {
          'content-type': 'application/json',
          'X-RapidAPI-Key': 'bc66470ff3msh5d9a8bc58090646p13a8dajsnfe840ab0a68f',
          'X-RapidAPI-Host': 'deep-translate1.p.rapidapi.com'
        },
        body: body);
    final json = jsonDecode(result.body);
    final data = Data.fromJson(json);
    return data.translations.translatedText.text;
  }
}
