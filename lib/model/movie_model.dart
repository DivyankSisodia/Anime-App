class Movie {
  final String id;
  final String name;
  final String poster;
  final String duration;
  final String type;
  final String rating;
  final Episodes episodes;

  Movie({
    required this.id,
    required this.name,
    required this.poster,
    required this.duration,
    required this.type,
    required this.rating,
    required this.episodes,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['name'],
      poster: json['poster'],
      duration: json['duration'],
      type: json['type'],
      rating: json['rating'],
      episodes: Episodes.fromJson(json['episodes']),
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
