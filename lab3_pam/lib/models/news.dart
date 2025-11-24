import 'publisher.dart';

DateTime _parseShortDate(String? s) {
  if (s == null || s.isEmpty) return DateTime.now();
  // format: "Jun 11, 2023"
  final cleaned = s.replaceAll(',', '');
  final parts = cleaned.split(' '); // [Jun, 11, 2023]
  if (parts.length != 3) return DateTime.now();

  const months = {
    'Jan': 1,
    'Feb': 2,
    'Mar': 3,
    'Apr': 4,
    'May': 5,
    'Jun': 6,
    'Jul': 7,
    'Aug': 8,
    'Sep': 9,
    'Oct': 10,
    'Nov': 11,
    'Dec': 12,
  };

  final month = months[parts[0]] ?? 1;
  final day = int.tryParse(parts[1]) ?? 1;
  final year = int.tryParse(parts[2]) ?? DateTime.now().year;

  return DateTime(year, month, day);
}

class News {
  final String id;
  final String title;
  final String? subtitle;
  final String category;
  /// Poate fi fie path local ("resources/images/..."), fie URL ("https://...")
  final String imageAsset;
  final String source;
  final DateTime date;
  final Publisher publisher;

  News({
    required this.id,
    required this.title,
    this.subtitle,
    required this.category,
    required this.imageAsset,
    required this.source,
    required this.date,
    required this.publisher,
  });

  /// Constructor din JSON pentru `news_app.json` și `news_app_details.json`
  factory News.fromJson(Map<String, dynamic> json) {
    final publisherName = json['publisher'] as String? ?? 'Unknown';

    return News(
      id: json['id'].toString(),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?, // în JSON nu ai, dar e ok null
      category: json['category'] as String? ?? 'General',
      imageAsset: json['image'] as String,
      source: publisherName,
      date: _parseShortDate(json['date'] as String?),
      publisher: Publisher.fromJsonForNews(
        name: publisherName,
        iconUrl: json['publisher_icon'] as String?,
      ),
    );
  }
}