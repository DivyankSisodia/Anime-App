import 'package:anime_app/utils/constants/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/searchBar/search_bar_controller.dart';
import '../video-Player/video_player.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = ref.watch(searchControllerProvider);
    final searchState = ref.watch(searchResultsProvider);

    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/icons/Back.png',
            color: Colors.amber,
            height: 30,
            width: 30,
          ),
        ),
        title: const Text(
          'Search',
          style: TextStyle(
            color: DColors.pureWhite,
            fontSize: 24,
          ),
        ),
        backgroundColor: DColors.backgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: DColors.pureWhite,
              style: const TextStyle(color: DColors.pureWhite),
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: DColors.pureWhite),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: DColors.lighterColor),
                ),
                hintText: 'Search...',
                hintStyle: const TextStyle(color: DColors.pureWhite),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.amber,
                      size: 32,
                    ),
                    onPressed: () {
                      ref
                          .read(searchResultsProvider.notifier)
                          .fetchSearchResults(searchController.text);
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: searchState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : searchState.searchResults.isEmpty &&
                        searchController.text.isNotEmpty
                    ? const Center(child: Text('No data found'))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: searchController.text.isNotEmpty
                                ? Text(
                                    'Result for ${searchController.text.toUpperCase()}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: DColors.pureWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Text(
                                    'Recent Searches',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: DColors.pureWhite,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: searchController.text.isNotEmpty
                                  ? searchState.searchResults.length
                                  : searchState.staticAnimes.length,
                              itemBuilder: (context, index) {
                                final result = searchController.text.isNotEmpty
                                    ? searchState.searchResults[index]
                                    : searchState.staticAnimes[index];
                                return Container(
                                  height: 120,
                                  width: double.infinity,
                                  margin: const EdgeInsets.all(8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: DColors.lightColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: CachedNetworkImage(
                                          imageUrl: result['poster'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Gap(20),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              result['name'],
                                              maxLines: 3,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Poppins',
                                                  color: DColors.pureWhite),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Episodes: ${result['episodes']['sub']}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 178, 177, 177),
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                                Text(
                                                  result['type'],
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 178, 177, 177),
                                                    fontFamily: 'Poppins',
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      const Gap(20),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const VideoScreen(),
                                            ),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.play_circle_fill,
                                          color: Colors.amber,
                                          size: 35,
                                          shadows: [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
          ),
        ],
      ),
    );
  }
}
