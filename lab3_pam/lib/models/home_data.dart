import 'news.dart';

class AppUser {
  final String name;
  final String profileImage;
  final int notificationCount;

  AppUser({
    required this.name,
    required this.profileImage,
    required this.notificationCount,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      name: json['name'] as String,
      profileImage: json['profile_image'] as String,
      notificationCount: json['notification_count'] as int,
    );
  }
}

class HomeData {
  final AppUser user;
  final List<News> trending;
  final List<News> recommendations;

  HomeData({
    required this.user,
    required this.trending,
    required this.recommendations,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    final trendingList = (json['trending_news'] as List<dynamic>)
        .map((e) => News.fromJson(e as Map<String, dynamic>))
        .toList();

    final recommendationsList = (json['recommendations'] as List<dynamic>)
        .map((e) => News.fromJson(e as Map<String, dynamic>))
        .toList();

    return HomeData(
      user: AppUser.fromJson(json['user'] as Map<String, dynamic>),
      trending: trendingList,
      recommendations: recommendationsList,
    );
  }
}