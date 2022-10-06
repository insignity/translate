// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translate_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TranslateStore on _TranslateStore, Store {
  Computed<int>? _$lastPageComputed;

  @override
  int get lastPage => (_$lastPageComputed ??=
          Computed<int>(() => super.lastPage, name: '_TranslateStore.lastPage'))
      .value;

  late final _$_isLoadingAtom =
      Atom(name: '_TranslateStore._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_titleAtom =
      Atom(name: '_TranslateStore._title', context: context);

  String get title {
    _$_titleAtom.reportRead();
    return super._title;
  }

  @override
  String get _title => title;

  @override
  set _title(String value) {
    _$_titleAtom.reportWrite(value, super._title, () {
      super._title = value;
    });
  }

  late final _$pageAtom = Atom(name: '_TranslateStore.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$_TranslateStoreActionController =
      ActionController(name: '_TranslateStore', context: context);

  @override
  String? nextString(int page) {
    final _$actionInfo = _$_TranslateStoreActionController.startAction(
        name: '_TranslateStore.nextString');
    try {
      return super.nextString(page);
    } finally {
      _$_TranslateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
lastPage: ${lastPage}
    ''';
  }
}
