import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../search_screen/search.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/style.dart';
import '../../widgets/anime_stack/fav_anime_card.dart';
import '../../widgets/anime_stack/merch_cards.dart';
import '../../widgets/anime_stack/movie_card.dart';

class AnimeScreens extends ConsumerWidget {
  const AnimeScreens({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the mangaListProvider to get manga data
    // final AsyncValue<List<Manga>> mangaList = ref.watch(mangaDataProvider);

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: DColors.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          backgroundColor: DColors.backgroundColor,
          flexibleSpace: SizedBox(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Browse',
                    style: DStyle.mediumlargeHeading,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      'assets/icons/Search.png',
                      color: DColors.pureWhite,
                      width: 70,
                    ),
                  )
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.only(left: 20, right: 33),
            dividerColor: DColors.backgroundColor,
            labelPadding: EdgeInsets.only(left: 8, right: 33),
            indicatorColor: DColors.splashColor,
            labelColor: DColors.primaryColor,
            isScrollable: true,
            tabs: [
              Tab(
                child: Text('Anime', style: DStyle.mediumbuttonText),
              ),
              Tab(
                child: Text('Movies', style: DStyle.mediumbuttonText),
              ),
              Tab(
                child: Text('Merch', style: DStyle.mediumbuttonText),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const FavAnimeCard(),
            // Display manga data when available
            const MovieCard(),
            MerchPage(),
          ],
        ),
      ),
    );
  }
}
