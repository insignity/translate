class Data {
  final Translations translations;

  Data(this.translations);

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(Translations.fromJson(json['data']));
}

class Translations {
  final TranslatedText translatedText;

  Translations(this.translatedText);

  factory Translations.fromJson(Map<String, dynamic> json) =>
      Translations(TranslatedText.fromJson(json['translations']));
}

class TranslatedText{
  final String text;

  TranslatedText(this.text);


  factory TranslatedText.fromJson(Map<String, dynamic> json) =>
      TranslatedText(json['translatedText']);
}