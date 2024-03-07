import 'dart:convert';

import 'package:anime_app/model/fav_anime_model.dart';
import 'package:http/http.dart' as http;

class FavAnimeServices{
  String favAnimeUrl = "https://api-aniwatch.onrender.com/anime/most-favorite?page=1";

  Future<List<FavAnime>> getFavAnime() async{
    final response = await http.get(Uri.parse(favAnimeUrl));
    if(response.statusCode == 200){
      List<dynamic> result = jsonDecode(response.body)['animes'];
      return result.map((e) => FavAnime.fromJson(e)).toList();
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}