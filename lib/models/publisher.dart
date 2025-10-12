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
}
