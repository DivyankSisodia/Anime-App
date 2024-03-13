import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final searchControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());
final searchResultsProvider =
    StateNotifierProvider<SearchNotifier, SearchState>(
        (ref) => SearchNotifier());

class SearchState {
  final List<dynamic> searchResults;
  final List<dynamic> staticAnimes;
  final bool isLoading;
  final String searchQuery;

  SearchState({
    this.searchResults = const [],
    this.staticAnimes = const [],
    this.isLoading = false,
    this.searchQuery = '',
  });

  SearchState copyWith({
    List<dynamic>? searchResults,
    List<dynamic>? staticAnimes,
    bool? isLoading,
    String? searchQuery,
  }) {
    return SearchState(
      searchResults: searchResults ?? this.searchResults,
      staticAnimes: staticAnimes ?? this.staticAnimes,
      isLoading: isLoading ?? this.isLoading,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(staticAnimes: _staticAnimes));

  Future<void> fetchSearchResults(String query) async {
    state = state.copyWith(isLoading: true, searchQuery: query);

    final response = await http.get(Uri.parse(
        'https://api-aniwatch.onrender.com/anime/search?q=$query&page=1'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      state =
          state.copyWith(searchResults: jsonData['animes'], isLoading: false);
    } else {
      state = state.copyWith(isLoading: false);
      // Handle error
    }
  }

  static const List<dynamic> _staticAnimes = [
    {
      "id": "demon-slayer-kimetsu-no-yaiba-18976",
      "name": "Fate Grand",
      "poster":
          "https://cdn.noitatnemucod.net/thumbnail/300x400/100/dc8b7cb55357ca963a3f8d0cc36eb380.jpg",
      "duration": "23m",
      "type": "TV",
      "rating": "18+",
      "episodes": {"sub": 26, "dub": 26}
    },
    {
      "id": "jujutsu-kaisen-17615",
      "name": "Jujutsu Kaisen",
      "poster":
          "https://cdn.noitatnemucod.net/thumbnail/300x400/100/78d183cd4fe881d5b656c52053d73c77.jpg",
      "duration": "24m",
      "type": "TV",
      "rating": "18+",
      "episodes": {"sub": 24, "dub": 24}
    },
    {
      "id": "attack-on-titan-the-final-season-part-3-18329",
      "name": "Attack on Titan",
      "poster":
          "https://cdn.noitatnemucod.net/thumbnail/300x400/100/54d3f59bcc7caf1539c701eb0a064ec9.png",
      "duration": "24m",
      "type": "TV",
      "rating": "18+",
      "episodes": {"sub": 24, "dub": 24}
    },
    {
      "id": "One Piece",
      "name": "One Piece",
      "poster":
          "https://cdn.noitatnemucod.net/thumbnail/300x400/100/fd758a025129d9fb3806b27d3e5f428b.jpg",
      "duration": "24m",
      "type": "TV",
      "rating": "18+",
      "episodes": {"sub": 24, "dub": 24}
    },
    {
      "id": "Horimiya",
      "name": "Horimiya",
      "poster":
          "https://cdn.noitatnemucod.net/thumbnail/300x400/100/041a335c530fda22477df522037c92c5.png",
      "duration": "24m",
      "type": "TV",
      "rating": "18+",
      "episodes": {"sub": 24, "dub": 24}
    },
    {
      "id": "Vinland Saga",
      "name": "Vinland Saga",
      "poster":
          "https://cdn.noitatnemucod.net/thumbnail/300x400/100/9cc864ccccce7f38f7a100627ef21516.jpg",
      "duration": "24m",
      "type": "TV",
      "rating": "18+",
      "episodes": {"sub": 24, "dub": 24}
    },
    {
      "id": "Berserk",
      "name": "Berserk",
      "poster":
          "https://cdn.noitatnemucod.net/thumbnail/300x400/100/47c5be77f083a305b73753175aeb0002.jpg",
      "duration": "24m",
      "type": "TV",
      "rating": "18+",
      "episodes": {"sub": 24, "dub": 24}
    },
    // Add more static anime data here
  ];
}
