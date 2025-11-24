import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/home_data.dart';
import '../models/news.dart';
import '../models/publisher.dart';

class PublisherDetails {
  final Publisher publisher;
  final List<News> news;
  final List<String> sortBy;
  final String activeSort;

  PublisherDetails({
    required this.publisher,
    required this.news,
    required this.sortBy,
    required this.activeSort,
  });
}

class NewsRepository {
  Future<HomeData> loadHomeData() async {
    await Future.delayed(const Duration(milliseconds: 400)); // simulăm rețea

    final jsonString = await rootBundle.loadString('resources/news_app.json');
    final Map<String, dynamic> map = json.decode(jsonString);

    return HomeData.fromJson(map);
  }

  Future<PublisherDetails> loadPublisherDetails() async {
    await Future.delayed(const Duration(milliseconds: 400));

    final jsonString =
    await rootBundle.loadString('resources/news_app_details.json');
    final Map<String, dynamic> map = json.decode(jsonString);

    final publisher =
    Publisher.fromDetailsJson(map['publisher'] as Map<String, dynamic>);

    final filters = map['filters'] as Map<String, dynamic>;
    final sortBy =
    (filters['sort_by'] as List<dynamic>).cast<String>().toList();
    final activeSort = filters['active_sort'] as String;

    final newsList = (map['news'] as List<dynamic>)
        .map((e) => News.fromJson(e as Map<String, dynamic>))
        .toList();

    return PublisherDetails(
      publisher: publisher,
      news: newsList,
      sortBy: sortBy,
      activeSort: activeSort,
    );
  }
}