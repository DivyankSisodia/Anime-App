import 'package:anime_app/model/anime_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Anime> watchedAnime = [];
List<Anime> unwatchedAnime = [];
List<Anime> downloadedAnime = [];

class WatchedItemNotifier extends StateNotifier<List<Anime>> {
  WatchedItemNotifier() : super(watchedAnime);

  // add Anime to the list
  void addToWatched(Anime anime) {
    state = [...state, anime];
  }

  // remove Anime from the list
  void removeFromWatched(String id) {
    state = [
      for(final anime in state)
        if(anime.id != id) anime
    ];
  }
}

final watchedAnimeProvider = StateNotifierProvider<WatchedItemNotifier, List<Anime>>((ref) {
  return WatchedItemNotifier();
});

class UnWatchedItemNotifier extends StateNotifier<List<Anime>> {
  UnWatchedItemNotifier() : super(watchedAnime);

  // add Anime to the list
  void addToUnWatched(Anime anime) {
    state = [...state, anime];
  }

  // remove Anime from the list
  void removeFromUnWatched(String id) {
    state = [
      for (final anime in state)
        if (anime.id != id) anime
    ];
  }
}

final unWatchedAnimeProvider =
    StateNotifierProvider<UnWatchedItemNotifier, List<Anime>>((ref) {
  return UnWatchedItemNotifier();
});
