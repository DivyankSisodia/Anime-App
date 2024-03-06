import 'package:anime_app/services/API/movie_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/movie_model.dart';

final movieProvider = Provider<MovieServices>((ref) => MovieServices());

final movieDataProvider = FutureProvider.autoDispose<List<Movie>>((ref) async {
  final movieService = ref.read(movieProvider);
  return movieService.getMovies();
});