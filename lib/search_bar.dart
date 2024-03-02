// import 'dart:convert';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:http/http.dart' as http;
// import 'model/search_anime_model.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
// final List<SearchAnime> _searchAnime = [];

// final TextEditingController _searchController = TextEditingController();

// Future<void> getAnime(String searchQuery) async {
//   // Add a delay of 1 second before making the request
//   final response = await http.get(Uri.parse(
//       'https://api-aniwatch.onrender.com/anime/search?q=$_searchController&page=30'));
//   if (response.statusCode == 200) {
//     Map<String, dynamic> jsonData = jsonDecode(response.body);
//     debugPrint('jsonData: $jsonData');
//     if (jsonData.containsKey("suggestions")) {
//       List<dynamic> suggestions = jsonData["suggestions"];
//       debugPrint('Suggestions: $suggestions');
//       // _searchAnime.clear(); // Clear the list before adding new items
//       for (var element in suggestions) {
//         SearchAnime searchedAnimeData = SearchAnime.fromJson(element);
//         _searchAnime.add(searchedAnimeData);
//       }
//       setState(() {});
//     }
//   } else {
//     debugPrint('Failed to fetch anime data. Status code: ${response.statusCode}');
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search Anime'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search Anime',
//                 hintText: 'Enter Anime Name',
//                 prefixIcon: GestureDetector(
//                   onTap: () {
//                     getAnime(_searchController.text);
//                   },
//                   child: const Icon(Icons.search),
//                 ),
//                 border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//               ),
//             ),
//           ),
//           const Gap(20),
//           Expanded(child: searchedAnime(_searchAnime, context)),
//         ],
//       ),
//     );
//   }
// }

// Widget searchedAnime(List<SearchAnime> searchAnime, BuildContext context) {
//   return searchAnime.isEmpty
//       ? const Center(
//           child:  Text('No results found.'),
//         )
//       : GridView.count(
//           shrinkWrap: true,
//           crossAxisSpacing: 1,
//           mainAxisSpacing: 2,
//           crossAxisCount: 2,
//           children: searchAnime.map((searchAnime) {
//             return GridTile(
//               child: Hero(
//                 tag: searchAnime.suggestions != null &&
//                         searchAnime.suggestions!.isNotEmpty
//                     ? searchAnime.suggestions!.first.poster
//                     : '',
//                 child: Container(
//                   child: searchAnime.suggestions != null &&
//                           searchAnime.suggestions!.isNotEmpty
//                       ? CachedNetworkImage(
//                           imageUrl: searchAnime.suggestions!.first.poster,
//                           fit: BoxFit.cover,
//                         )
//                       : const Placeholder(),
//                 ),
//               ),
//             );
//           }).toList(),
//         );
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/search_anime_model.dart';

class YourSearchWidget extends StatefulWidget {
  @override
  _YourSearchWidgetState createState() => _YourSearchWidgetState();
}

class _YourSearchWidgetState extends State<YourSearchWidget> {
  // Your future function to fetch data from API
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
      debugPrint(
          'Failed to fetch anime data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) {
            getAnime(_searchController.text);
            showSearch(context: context, delegate: YourSearchDelegate());
          },
        ),
      ),
    );
  }
}

class YourSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for the app bar (e.g., Clear query button)
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon on the left of the app bar (e.g., Back button)
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show search results based on the query
    // Here you can use the query to filter data or perform any other search logic
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Suggestions that appear as the user types in the search field
    // Here you can display suggestions based on the query or recent searches
    return Center(
      child: Text('Suggestions for: $query'),
    );
  }
}
