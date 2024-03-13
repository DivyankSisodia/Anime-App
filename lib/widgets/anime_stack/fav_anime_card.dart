import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import 'package:anime_app/widgets/HomeScreen/common/vertical_loading_effect.dart';

import '../../controller/category/fav_anime_data_controller.dart';
import '../../screen/detail_page/fav_anime_detail_page.dart';
import '../../screen/detail_page/movie_anime_detail_page.dart';
import '../../utils/constants/style.dart';
import '../../utils/helper/helper_functions.dart';

class FavAnimeCard extends ConsumerWidget {
  const FavAnimeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Consumer(
        builder: (context, watch, child) {
          final favAnimeList = ref.watch(favAnimeDataProvider);
          return favAnimeList.when(
            data: (favAnimeData) {
              return MasonryGridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: favAnimeData.length,
                shrinkWrap: true,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 900),
                        reverseTransitionDuration:
                            const Duration(milliseconds: 600),
                        opaque: false,
                        pageBuilder: (context, animation, secondaryanimation) {
                          animation = CurvedAnimation(
                            parent: animation,
                            curve: Curves.decelerate,
                          );
                          return FadeTransition(
                            opacity: animation,
                            child: FavAnimeDetailScreen(
                              anime: favAnimeData[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: DHelperFunctions.screenHeight(context) * 0.35,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 6),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(12),
                              color: Colors.amber,
                              child: Image.network(
                                favAnimeData[index].poster,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Gap(4),
                          Flexible(
                            child: Container(
                              height: 200,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    favAnimeData[index].name,
                                    maxLines: 2,
                                    style: DStyle.mediumbuttonText,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Sub Ep : ${favAnimeData[index].episodes?.sub.toString()}',
                                            // Using ?. to handle potential nullability, and toString() to convert int to String
                                            maxLines: 1,
                                            style: DStyle.smallHeadingText,
                                          ),
                                          Text(
                                            'Dub Ep : ${favAnimeData[index].episodes?.dub.toString()}',
                                            // Using ?. to handle potential nullability, and toString() to convert int to String
                                            maxLines: 1,
                                            style: DStyle.smallHeadingText,
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.bookmark,
                                          color: Colors.greenAccent,
                                          size: 30, // Adjust the size as needed
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            loading: () => const Center(
              child: VerticalLoadingEffect(),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
          );
        },
      ),
    );
  }
}
