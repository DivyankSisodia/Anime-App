class FavAnime {
  final String id;
  final String name;
  final String poster;
  final String duration;
  final String type;
  final String rating;
  final Episodes? episodes;

  FavAnime({
    required this.id,
    required this.name,
    required this.poster,
    required this.duration,
    required this.type,
    required this.rating,
    required this.episodes,
  });

  factory FavAnime.fromJson(Map<String, dynamic> json) {
    return FavAnime(
      id: json['id'] ?? 'id',
      name: json['name'] ?? '',
      poster: json['poster'] ?? '',
      duration: json['duration'] ?? '',
      type: json['type'] ?? '',
      rating: json['rating'] ?? '',
      episodes:
          json['episodes'] != null ? Episodes.fromJson(json['episodes']) : null,
    );
  }
}

class Episodes {
  final int sub;
  final int? dub;

  Episodes({
    required this.sub,
    this.dub,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) {
    return Episodes(
      sub: json['sub'],
      dub: json['dub'],
    );
  }
}
