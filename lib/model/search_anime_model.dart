class SearchAnime {
  SearchAnime({
    this.suggestions,
  });

  late final List<Suggestions>? suggestions;

  SearchAnime.fromJson(Map<String, dynamic> json) {
    suggestions = (json['suggestions'] as List?)
        ?.map((e) => Suggestions.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['suggestions'] = suggestions?.map((e) => e.toJson()).toList();
    return data;
  }
}

class Suggestions {
  Suggestions({
    required this.id,
    required this.name,
    required this.jname,
    required this.poster,
    required this.moreInfo,
  });

  late final String id;
  late final String name;
  late final String jname;
  late final String poster;
  late final List<String> moreInfo;

  Suggestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    jname = json['jname'];
    poster = json['poster'];
    moreInfo = List.castFrom<dynamic, String>(json['moreInfo']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['jname'] = jname;
    data['poster'] = poster;
    data['moreInfo'] = moreInfo;
    return data;
  }
}
