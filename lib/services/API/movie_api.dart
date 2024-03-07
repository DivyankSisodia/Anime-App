import 'dart:convert';

import 'package:anime_app/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  String movieUrl = 'https://api-aniwatch.onrender.com/anime/movie?page=2';

  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse(movieUrl));
    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body)['animes'];
      return result.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
