// ignore_for_file: public_member_api_docs, sort_constructors_first, library_private_types_in_public_api
import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/utils/constants/text_strings.dart';

class TrendingOrPopularAnimeDetailScreen extends StatefulWidget {
  const TrendingOrPopularAnimeDetailScreen({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  _TrendingOrPopularAnimeDetailScreen createState() =>
      _TrendingOrPopularAnimeDetailScreen();
}

class _TrendingOrPopularAnimeDetailScreen
    extends State<TrendingOrPopularAnimeDetailScreen> {
  bool isexpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DColors.backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(widget.anime.poster),
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: DHelperFunctions.screenWidth(context) * 0.66,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        'assets/icons/Back To.png',
                        color: DColors.pureWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              height: 100,
              color: DColors.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: GestureDetector(
                      onTap: () {
                        DHelperFunctions.showSnackBar(
                            context, 'Added to Watched List');
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: DColors.lighterColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            DTexts.watched,
                            style: DStyle.smalllightbuttonDarkFontText,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    flex: 8,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: DColors.lighterColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          DTexts.unWatched,
                          style: DStyle.smalllightbuttonDarkFontText,
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: DColors.lighterColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          DTexts.download,
                          style: DStyle.smalllightbuttonDarkFontText,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: DColors.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: DColors.lighterColor,
                      blurRadius: 14,
                      spreadRadius: 8,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Gap(20),
                        Center(
                          child: Text(
                            widget.anime.name,
                            style: DStyle.mediumlargeHeading,
                          ),
                        ),
                        const Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  image: DecorationImage(
                                    image: NetworkImage(widget.anime.poster),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(30),
                            Flexible(
                              flex: 2,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        DTexts.rank,
                                        style: DStyle.mediumHeading,
                                      ),
                                      Text(
                                        widget.anime.rank.toString(),
                                        style: DStyle.mediumHeading,
                                      ),
                                    ],
                                  ),
                                  const Gap(30),
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: DColors.lighterColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            DTexts.play,
                                            style: DStyle
                                                .smalllightbuttonDarkFontText,
                                          ),
                                        ),
                                      ),
                                      const Gap(10),
                                      SizedBox(
                                        height: 50,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/icons/Plus Math.png',
                                              color: DColors.pureWhite,
                                              height: 24,
                                              width: 80,
                                            ),
                                            const Text(
                                              DTexts.mylist,
                                              style: DStyle
                                                  .smalllightbuttonDarkFontText,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
