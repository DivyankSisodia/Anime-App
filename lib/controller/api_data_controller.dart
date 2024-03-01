import 'package:anime_app/services/API/anime_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/anime_model.dart';

final animeProvider = Provider<ApiServices>((ref) => ApiServices());
final animeListProvider = FutureProvider.autoDispose<List<Anime>>((ref) async {
  final anime = ref.read(animeProvider);
  return anime.getTrendingAnime();
});

final topAnimeListProvider =
    FutureProvider.autoDispose<List<Anime>>((ref) async {
  final anime = ref.read(animeProvider);
  return anime.getUpcomingTopAnime();
});
