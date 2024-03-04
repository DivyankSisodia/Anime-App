// ignore_for_file: deprecated_member_use

import 'package:anime_app/services/API/anime_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/anime_model.dart';

// Provider for the API service
final animeProvider = Provider<AnimeServices>((ref) => AnimeServices());

// Provider for caching the trending anime data
final cachedTrendingAnimeProvider = StateProvider<List<Anime>>((ref) => []);

// Fetching trending anime
final animeListProvider = FutureProvider.autoDispose<List<Anime>>((ref) async {
  // Check if the data is already cached
  final cachedData = ref.watch(cachedTrendingAnimeProvider.notifier).state;
  if (cachedData.isNotEmpty) {
    return cachedData;
  }

  // If not cached, fetch the data from the API
  final anime = ref.read(animeProvider);
  final List<Anime> animeData = await anime.getTrendingAnime();

  // Cache the data
  ref.maintainState =
      true; // Prevents the provider from being disposed when no longer listened
  ref.read(cachedTrendingAnimeProvider.notifier).state = animeData;

  return animeData;
});

// Provider for caching the top airing anime data
final cachedTopAnimeProvider = StateProvider<List<Anime>>((ref) => []);

// Fetching top airing anime right now
final topAnimeListProvider =
    FutureProvider.autoDispose<List<Anime>>((ref) async {
  // Check if the data is already cached
  final cachedData = ref.watch(cachedTopAnimeProvider.notifier).state;
  if (cachedData.isNotEmpty) {
    return cachedData;
  }

  // If not cached, fetch the data from the API
  final anime = ref.read(animeProvider);
  final List<Anime> animeData = await anime.geTopAiringAnime();

  // Cache the data
  ref.maintainState = true;
  ref.read(cachedTopAnimeProvider.notifier).state = animeData;

  return animeData;
});

// Provider for caching the spotlight anime data
final cachedSpotlightAnimeProvider = StateProvider<List<Anime>>((ref) => []);

// Fetching spotlight anime
final spotLightProvider = FutureProvider.autoDispose<List<Anime>>((ref) async {
  // Check if the data is already cached
  final cachedData = ref.watch(cachedSpotlightAnimeProvider);
  if (cachedData.isNotEmpty) {
    return cachedData;
  }

  // If not cached, fetch the data from the API
  final anime = ref.read(animeProvider);
  final List<Anime> animeData = await anime.getSpotlightAnime();

  // Cache the data
  ref.maintainState = true;
  ref.read(cachedSpotlightAnimeProvider.notifier).state = animeData;

  return animeData;
});
