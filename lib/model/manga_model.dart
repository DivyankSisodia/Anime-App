class Manga {
  final int id;
  final String title;
  final String? imageUrl;
  final String? synopsis;
  final int? rank;

  Manga({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.synopsis,
    required this.rank,
  });

  factory Manga.fromJson(Map<String, dynamic> json) {
    return Manga(
      id: json['mal_id'] ?? 0, // Change the default value to match the type
      title: json['title'] ?? 'title',
      imageUrl: json['image']?['webp']?['image_url'] ??
          'error', // Handle null cases for nested keys
      synopsis: json['synopsis'] ?? '',
      rank: json['rank'] ?? 0, // Change the default value to match the type
    );
  }
}
