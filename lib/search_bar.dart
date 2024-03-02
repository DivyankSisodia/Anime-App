import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'model/search_anime_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<SearchAnime> _searchAnime = [];

  final TextEditingController _searchController = TextEditingController();

  Future<void> getAnime(String searchQuery) async {
    // Add a delay of 1 second before making the request
    final response = await http.get(Uri.parse(
        'https://api-aniwatch.onrender.com/anime/search?q=$_searchController&page=30'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      debugPrint('jsonData: $jsonData');
      if (jsonData.containsKey("suggestions")) {
        List<dynamic> suggestions = jsonData["suggestions"];
        debugPrint('Suggestions: $suggestions');
        // _searchAnime.clear(); // Clear the list before adding new items
        for (var element in suggestions) {
          SearchAnime searchedAnimeData = SearchAnime.fromJson(element);
          _searchAnime.add(searchedAnimeData);
        }
        setState(() {});
      }
    } else {
      debugPrint('Failed to fetch anime data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Anime'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Anime',
                hintText: 'Enter Anime Name',
                prefixIcon: GestureDetector(
                  onTap: () {
                    getAnime(_searchController.text);
                  },
                  child: const Icon(Icons.search),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          ),
          const Gap(20),
          Expanded(child: searchedAnime(_searchAnime, context)),
        ],
      ),
    );
  }
}

Widget searchedAnime(List<SearchAnime> searchAnime, BuildContext context) {
  return searchAnime.isEmpty
      ? const Center(
          child:  Text('No results found.'),
        )
      : GridView.count(
          shrinkWrap: true,
          crossAxisSpacing: 1,
          mainAxisSpacing: 2,
          crossAxisCount: 2,
          children: searchAnime.map((searchAnime) {
            return GridTile(
              child: Hero(
                tag: searchAnime.suggestions != null &&
                        searchAnime.suggestions!.isNotEmpty
                    ? searchAnime.suggestions!.first.poster
                    : '',
                child: Container(
                  child: searchAnime.suggestions != null &&
                          searchAnime.suggestions!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: searchAnime.suggestions!.first.poster,
                          fit: BoxFit.cover,
                        )
                      : const Placeholder(),
                ),
              ),
            );
          }).toList(),
        );
}
