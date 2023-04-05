import 'dart:convert';

ResponseModel? responseModelFromJson(String str) => ResponseModel.fromJson(json.decode(str));

String responseModelToJson(ResponseModel? data) => json.encode(data!.toJson());

class ResponseModel {
  ResponseModel({
    this.search,
  });

  Search? search;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
    search: Search.fromJson(json["search"]),
  );

  Map<String, dynamic> toJson() => {
    "search": search!.toJson(),
  };
}
class Search {
  Search({
    this.query,
    this.totalResults,
    this.currentPage,
    this.totalPages,
    this.results,
  });

  String? query;
  int? totalResults;
  int? currentPage;
  int? totalPages;
  List<Result>? results;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    query: json["query"],
    totalResults: json["total_results"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "query": query,
    "total_results": totalResults,
    "current_page": currentPage,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.verseKey,
    this.verseId,
    this.text,
    this.highlighted,
    this.words,
    this.translations,
  });

  String? verseKey;
  int? verseId;
  String? text;
  dynamic highlighted;
  List<Word>? words;
  List<Translation>? translations;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    verseKey: json["verse_key"],
    verseId: json["verse_id"],
    text: json["text"],
    highlighted: json["highlighted"],
    words: List<Word>.from(json["words"].map((x) => Word.fromJson(x))),
    translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "verse_key": verseKey,
    "verse_id": verseId,
    "text": text,
    "highlighted": highlighted,
    "words": List<dynamic>.from(words!.map((x) => x.toJson())),
    "translations": List<dynamic>.from(translations!.map((x) => x.toJson())),
  };
}

class Translation {
  Translation({
    this.text,
    this.resourceId,
    this.name,
    this.languageName,
  });

  String? text;
  int? resourceId;
  String? name;
  String? languageName;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    text: json["text"],
    resourceId: json["resource_id"],
    name: json["name"],
    languageName: json["language_name"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "resource_id": resourceId,
    "name": name,
    "language_name": languageName,
  };
}

class Word {
  Word({
    this.charType,
    this.text,
  });

  String? charType;
  String? text;

  factory Word.fromJson(Map<String, dynamic> json) => Word(
    charType: json["char_type"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "char_type": charType,
    "text": text,
  };
}
