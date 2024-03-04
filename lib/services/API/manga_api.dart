import 'dart:convert';
import 'package:http/http.dart';
import '../../model/manga_model.dart';

class MangaServices {
  String mangaUrl = 'http://api.jikan.moe/v4/manga';

  Future<List<Manga>> getMangaData() async {
    final Response response = await get(Uri.parse(mangaUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> mangaList = responseData['data'] ?? [];
      return mangaList.map((e) => Manga.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load manga data: ${response.reasonPhrase}');
    }
  }
}
