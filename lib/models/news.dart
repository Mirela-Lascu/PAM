import 'publisher.dart';

class News {
  final String id;
  final String title;
  final String? subtitle;
  final String category;
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
}
