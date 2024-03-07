// ignore_for_file: deprecated_member_use

import 'package:anime_app/services/API/movie_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/movie_model.dart';

final movieProvider = Provider<MovieServices>((ref) => MovieServices());

final cachedMovieProvider = StateProvider<List<Movie>>((ref) => []);

final movieDataProvider = FutureProvider.autoDispose<List<Movie>>((ref) async {
  final cachedMovieData = ref.watch(cachedMovieProvider.notifier).state;

  if (cachedMovieData.isNotEmpty) {
    return cachedMovieData;
  }

  final movie = ref.read(movieProvider);
  final List<Movie> movieData = await movie.getMovies();

  ref.maintainState = true;

  ref.read(cachedMovieProvider.notifier).state = movieData;

  return movieData;
});
