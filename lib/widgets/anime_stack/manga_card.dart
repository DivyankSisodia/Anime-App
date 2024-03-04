import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/manga_api_controller.dart';
import '../../model/manga_model.dart';
import '../HomeScreen/common/loading_effect.dart';

class MangaCard extends ConsumerWidget {
  const MangaCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Manga>> mangaData = ref.watch(mangaDataProvider);
    return Scaffold(
      body: mangaData.when(
        data: (mangaList) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: mangaList.length,
            itemBuilder: (context, index) {
              final manga = mangaList[index];
              return Card(
                child: ListTile(
                  title: Text(manga.title), // Display manga title
                  subtitle: Text(
                    manga.synopsis ?? 'No synopsis available',
                    maxLines: 5,
                  ),
                  leading: SizedBox(
                      width: 50,
                      child:
                          CachedNetworkImage(imageUrl: manga.imageUrl ?? '')),
                ),
              );
            },
          );
        },
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
        loading: () => const LoadingEffect(),
      ),
    );
  }
}
