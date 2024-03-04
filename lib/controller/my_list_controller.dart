import 'package:anime_app/model/anime_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Anime> watchedAnime = [];

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