// class Anime {
//   List<TrendingAnimes>? trendingAnimes;
//   List<LatestEpisodeAnimes>? latestEpisodeAnimes;
//   List<TopAiringAnimes>? topAiringAnimes;

//   Anime({
//     this.trendingAnimes,
//     this.latestEpisodeAnimes,
//     this.topAiringAnimes,
//   });
// }

// class TrendingAnimes {
//   int? rank;
//   String? name;
//   String? id;
//   String? poster;

//   TrendingAnimes({
//      this.rank,
//      this.name,
//      this.id,
//      this.poster,
//   });

//   factory TrendingAnimes.fromJson(Map<String, dynamic> json) {
//     return TrendingAnimes(
//       rank: json['rank'],
//       name: json['name'],
//       id: json['id'],
//       poster: json['poster'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'rank': rank,
//       'name': name,
//       'id': id,
//       'poster': poster,
//     };
//   }
// }

// class TrendingAnimeList {
//   List<TrendingAnime> trendingAnimes;

//   TrendingAnimeList({
//     required this.trendingAnimes,
//   });

//   factory TrendingAnimeList.fromJson(Map<String, dynamic> json) {
//     var trendingAnimesJson = json['trendingAnimes'] as List;
//     List<TrendingAnime> trendingAnimes = trendingAnimesJson
//         .map((animeJson) => TrendingAnime.fromJson(animeJson))
//         .toList();

//     return TrendingAnimeList(trendingAnimes: trendingAnimes);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'trendingAnimes': trendingAnimes.map((anime) => anime.toJson()).toList(),
//     };
//   }
// }

class Anime {
  final int rank;
  final String id;
  final String name;
  final String description;
  final String poster;
  final String jname;
  final Map<String, int> episodes;
  final List<String> otherInfo;

  Anime({
    required this.rank,
    required this.id,
    required this.name,
    required this.description,
    required this.poster,
    required this.jname,
    required this.episodes,
    required this.otherInfo,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      rank: json['rank'] ?? 0,
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      poster: json['poster'] ?? '',
      jname: json['jname'] ?? '',
      episodes: {
        'sub': json['episodes']?['sub'] ?? 0,
        'dub': json['episodes']?['dub'] ?? 0,
      },
      otherInfo: List<String>.from(json['otherInfo'] ?? []),
    );
  }
}

class AnimeList {
  final List<Anime> spotlightAnimes;
  final List<Anime> trendingAnimes;
  final List<Anime> latestEpisodeAnimes;

  AnimeList({
    required this.spotlightAnimes,
    required this.trendingAnimes,
    required this.latestEpisodeAnimes,
  });

  factory AnimeList.fromJson(Map<String, dynamic> json) {
    return AnimeList(
      spotlightAnimes: List<Anime>.from(
          json['spotlightAnimes']?.map((x) => Anime.fromJson(x)) ?? []),
      trendingAnimes: List<Anime>.from(
          json['trendingAnimes']?.map((x) => Anime.fromJson(x)) ?? []),
      latestEpisodeAnimes: List<Anime>.from(
          json['latestEpisodeAnimes']?.map((x) => Anime.fromJson(x)) ?? []),
    );
  }
}
