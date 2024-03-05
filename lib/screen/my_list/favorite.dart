import 'package:anime_app/screen/my_list/unwatched_anime.dart';
import 'package:anime_app/screen/my_list/watched_anime_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/style.dart';
import '../../utils/constants/text_strings.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: DColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: DColors.backgroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                DTexts.mylist,
                style: DStyle.mediumlargeHeading,
              ),
              Image.asset(
                'assets/icons/Search.png',
                color: DColors.pureWhite,
                width: 80,
              )
            ],
          ),
          bottom: const TabBar(
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.only(left: 20, right: 28),
            dividerColor: DColors.backgroundColor,
            labelPadding: EdgeInsets.only(left: 8, right: 28),
            indicatorColor: DColors.splashColor,
            labelColor: DColors.primaryColor,
            isScrollable: true,
            tabs: [
              Tab(
                child: Text(DTexts.watched, style: DStyle.smalllightbuttonText),
              ),
              Tab(
                child:
                    Text(DTexts.unWatched, style: DStyle.smalllightbuttonText),
              ),
              Tab(
                child:
                    Text(DTexts.downloads, style: DStyle.smalllightbuttonText),
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            WatchedAnimePage(),

            // Display manga data when available
            UnWatchedAnimePage(),
            Center(child: Text('Merch', style: DStyle.mediumbuttonText)),
          ],
        ),
      ),
    );
  }
}
