// ignore_for_file: deprecated_member_use

import 'package:anime_app/services/API/fav_anime_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/fav_anime_model.dart';

final favAnimeProvider =
    Provider<FavAnimeServices>((ref) => FavAnimeServices());

final cachedFavMovieProvider = StateProvider<List<FavAnime>>((ref) => []);

final favAnimeDataProvider =
    FutureProvider.autoDispose<List<FavAnime>>((ref) async {
  final cachedFavMovieData = ref.watch(cachedFavMovieProvider.notifier).state;

  if (cachedFavMovieData.isNotEmpty) {
    return cachedFavMovieData;
  }

  final favAnime = ref.read(favAnimeProvider);
  final List<FavAnime> favAnimeData = await favAnime.getFavAnime();

  ref.maintainState = true;

  ref.read(cachedFavMovieProvider.notifier).state = favAnimeData;

  return favAnimeData;
});
