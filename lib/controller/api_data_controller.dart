import 'package:anime_app/services/API/anime_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/anime_model.dart';

final animeProvider = Provider<ApiServices>((ref) => ApiServices());

// Fetching trending anime
final animeListProvider = FutureProvider.autoDispose<List<Anime>>((ref) async {
  final anime = ref.read(animeProvider);
  return anime.getTrendingAnime();
});


// Fetching top airing anime right now
final topAnimeListProvider =
    FutureProvider.autoDispose<List<Anime>>((ref) async {
  final anime = ref.read(animeProvider);
  return anime.geTopAiringAnime();
});
