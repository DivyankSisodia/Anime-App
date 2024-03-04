import 'package:anime_app/model/manga_model.dart';
import 'package:anime_app/services/API/manga_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mangaProvider = Provider<MangaServices>((ref) => MangaServices());

final mangaDataProvider = FutureProvider<List<Manga>>((ref) async {
  return ref.watch(mangaProvider).getMangaData();
});