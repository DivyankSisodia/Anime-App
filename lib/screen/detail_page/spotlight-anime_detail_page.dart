// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:anime_app/model/anime_model.dart';
import 'package:anime_app/utils/constants/colors.dart';
import 'package:anime_app/utils/constants/style.dart';
import 'package:anime_app/utils/constants/text_strings.dart';

class AnimeDetailScreen extends StatefulWidget {
  const AnimeDetailScreen({
    super.key,
    required this.anime,
  });

  final Anime anime;

  @override
  _AnimeDetailScreenState createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
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
              padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(widget.anime.poster),
                      fit: BoxFit.cover,
                      height: DHelperFunctions.screenHeight(context) * 0.6,
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
                      children: [
                        Text(
                          widget.anime.name,
                          style: DStyle.mediumbuttonText,
                        ),
                        const Gap(10),
                        Text(
                          widget.anime.jname,
                          style: DStyle.smallHeading,
                        ),
                        const Gap(10),
                        Text(
                          widget.anime.description,
                          style: DStyle.smalllightbuttonText,
                          maxLines:
                              isexpanded ? widget.anime.description.length : 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isexpanded = !isexpanded;
                            });
                          },
                          child: Text(
                            isexpanded ? "Read Less" : "Read More",
                            style: DStyle.highlightedText,
                          ),
                        ),
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
