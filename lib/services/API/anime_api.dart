import 'dart:convert';
import 'package:http/http.dart';
import '../../model/anime_model.dart';

class ApiServices {
  String animeUrl = "https://api-aniwatch.onrender.com/anime/home";

  Future<List<Anime>> getTrendingAnime() async {
    Response response = await get(Uri.parse(animeUrl));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body)['trendingAnimes'];
      return result.map((e) => Anime.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<Anime>> geTopAiringAnime() async {
    Response response = await get(Uri.parse(animeUrl));

    print('aagya andar');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body)['topAiringAnimes'];
      print(result);
      return result.map((e) => Anime.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  
}
