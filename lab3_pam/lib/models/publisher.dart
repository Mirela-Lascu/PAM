class Publisher {
  final String id;
  final String name;
  final String handle;

  final String logoAsset;
  final double newsCount;
  final double followers;
  final int following;
  final String about;

  const Publisher({
    required this.id,
    required this.name,
    required this.handle,
    required this.logoAsset,
    required this.newsCount,
    required this.followers,
    required this.following,
    required this.about,
  });

  factory Publisher.fromJsonForNews({
    required String name,
    String? iconUrl,
  }) {
    final id = name.toLowerCase().replaceAll(' ', '_');

    String logo;
    if (iconUrl == null || iconUrl.isEmpty) {
      logo = '';
    } else if (iconUrl.endsWith('.svg')) {
      logo = 'resources/images/forbes_logo.png';
    } else {
      logo = iconUrl;
    }

    return Publisher(
      id: id,
      name: name,
      handle: '@$id',
      logoAsset: logo,
      newsCount: 0,
      followers: 0,
      following: 0,
      about: '',
    );
  }

  factory Publisher.fromDetailsJson(Map<String, dynamic> json) {
    final stats = json['stats'] as Map<String, dynamic>;

    double parseK(String value) {
      // "6.8k" -> 6.8
      if (value.endsWith('k')) {
        return double.tryParse(value.substring(0, value.length - 1)) ?? 0;
      }
      return double.tryParse(value) ?? 0;
    }

    return Publisher(
      id: json['username'] as String,
      name: json['name'] as String,
      handle: json['username'] as String,
      logoAsset: 'resources/images/forbes_logo.png',
      newsCount: parseK(stats['news_count'] as String),
      followers: parseK(stats['followers'] as String),
      following: stats['following'] as int,
      about: json['bio'] as String,
    );
  }
}