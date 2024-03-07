import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import '../../controller/category/movie_data_controller.dart';
import '../../model/movie_model.dart';
import '../../utils/constants/style.dart';
import '../HomeScreen/common/loading_effect.dart';

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
                itemBuilder: (context, index) => Container(
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
                          child: Container(
                            height: 200,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  moviesData[index].name,
                                  maxLines: 2,
                                  style: DStyle.smallHeadingText,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      // Add this Expanded widget
                                      child: Text(
                                        'Length : ${moviesData[index].duration}',
                                        maxLines: 1,
                                        style: DStyle.smallHeadingText,
                                      ),
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
              );
            },
            error: ((error, stackTrace) => Center(
                  child: Text(
                    'Error : $error',
                    style: DStyle.mediumHeading,
                  ),
                )),
            loading: () => const LoadingEffect(),
          );
        },
      ),
    );
  }
}
