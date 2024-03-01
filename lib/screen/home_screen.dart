import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/utils/constants/text_strings.dart';
import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/api_data_controller.dart';
import '../model/anime_model.dart';
import '../utils/constants/colors.dart';

class AppHomeScreen extends ConsumerWidget {
  const AppHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/home_image.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 80,
                    left: 10,
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            Text(
                              DTexts.action,
                              style: DStyle.smalllightbuttonText,
                            ),
                            Gap(25),
                            Text(
                              DTexts.drama,
                              style: DStyle.smalllightbuttonText,
                            ),
                            Gap(25),
                            Text(
                              DTexts.adventure,
                              style: DStyle.smalllightbuttonText,
                            ),
                            Gap(25),
                            Text(
                              DTexts.thriller,
                              style: DStyle.smalllightbuttonText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 20,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/Plus Math.png',
                            color: DColors.pureWhite,
                            height: 30,
                            width: 80,
                          ),
                          const Text(
                            DTexts.mylist,
                            style: DStyle.smalllightbuttonText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 20,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/Info.png',
                            color: DColors.pureWhite,
                            height: 30,
                            width: 80,
                          ),
                          const Text(
                            DTexts.info,
                            style: DStyle.smalllightbuttonText,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: 2,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/image 1.png',
                            color: DColors.pureWhite,
                            height: 30,
                            width: 30,
                          ),
                          Image.asset(
                            'assets/icons/Search.png',
                            color: DColors.pureWhite,
                            height: 30,
                            width: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.35,
                    bottom: 10,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                        color: DColors.lightColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Text(
                          DTexts.play,
                          style: DStyle.mediumbuttonText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        DTexts.freeToWatch,
                        style: DStyle.mediumHeading,
                      ),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Consumer(
                        builder: (context, watch, child) {
                          final animeList = ref.watch(animeListProvider);
                          return animeList.when(
                            data: (animeData) {
                              return Container(
                                height: DHelperFunctions.screenHeight(context) *
                                    0.209,
                                width: double.infinity,
                                color: DColors.backgroundColor,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: animeData.length,
                                  itemBuilder: (context, index) {
                                    final anime = animeData[index];
                                    return _buildAnimeCard(anime);
                                  },
                                ),
                              );
                            },
                            loading: () => SizedBox(
                              height: 180,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 5, // Or any placeholder count
                                itemBuilder: (context, index) =>
                                    _shimmerAnimeCard(),
                              ),
                            ),
                            error: (error, stackTrace) => Text('Error: $error'),
                          );
                        },
                      ),
                    ),
                    const Gap(15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DTexts.popular,
                            style: DStyle.mediumHeading,
                          ),
                          Text(
                            DTexts.seeAll,
                            style: DStyle.smalllightbuttonText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildAnimeCard(Anime anime) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    height: 200,
    width: 150,
    decoration: BoxDecoration(
      color: DColors.backgroundColor,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          child: Image.network(
            anime.poster,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            maxLines: 1,
            anime.name,
            textAlign: TextAlign.center,
            style: DStyle.smallHeadingText,
          ),
        ),
      ],
    ),
  );
}

Widget _shimmerAnimeCard() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    height: 200,
    width: 150,
    decoration: BoxDecoration(
      color: DColors.backgroundColor,
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
