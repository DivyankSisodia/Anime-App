import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import '../../controller/category/movie_data_controller.dart';
import '../../model/movie_model.dart';

import '../../screen/detail_page/movie_anime_detail_page.dart';
import '../../utils/constants/style.dart';
import '../HomeScreen/common/vertical_loading_effect.dart';

class MovieCard extends ConsumerWidget {
  const MovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Consumer(
        builder: (context, watch, child) {
          final AsyncValue<List<Movie>> movieList =
              ref.watch(movieDataProvider);
          return movieList.when(
            data: (moviesData) {
              return MasonryGridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: moviesData.length,
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
                            child: MovieDetailScreen(
                              movie: moviesData[index],
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
                                moviesData[index].poster,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Gap(4),
                          Flexible(
                            child: SizedBox(
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 11,
                                    ),
                                    child: Text(
                                      moviesData[index].name,
                                      maxLines: 3,
                                      style: DStyle.smallHeadingText,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Duration : ${moviesData[index].duration}',
                                          maxLines: 1,
                                          style: DStyle.smallHeadingText,
                                        ),
                                        Flexible(
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.bookmark,
                                              color: Colors.greenAccent,
                                              size:
                                                  20, // Adjust the size as needed
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
            error: ((error, stackTrace) => Center(
                  child: Text(
                    'Error : $error',
                    style: DStyle.mediumHeading,
                  ),
                )),
            loading: () => const VerticalLoadingEffect(),
          );
        },
      ),
    );
  }
}
