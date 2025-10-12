import '../models/news.dart';
import '../models/publisher.dart';

String formatShortDate(DateTime d) {
  const months = [
    'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'
  ];
  return '${months[d.month - 1]} ${d.day}, ${d.year}';
}

const forbes = Publisher(
  id: 'forbes',
  name: 'Forbes',
  handle: 'forbesnews',
  logoAsset: 'resources/images/forbes_logo.png',
  newsCount: 6.8,
  followers: 2.5,
  following: 100,
  about:
  'Empowering your business journey with expert insights and influential perspectives.',
);

final trendingNews = <News>[
  News(
    id: 'env-1',
    title: 'Global Summit on Climate Change: Historic Agreement Reached',
    subtitle: 'World leaders commit to ambitious targets.',
    category: 'Environment',
    imageAsset: 'resources/images/environment.png',
    source: 'BBC News',
    date: DateTime(2023, 6, 9),
    publisher: forbes,
  ),
  News(
    id: 'tech-1',
    title: 'Tech Giants Reveal New AI-powered Devices',
    subtitle: 'Next-gen assistants hit the market.',
    category: 'Technology',
    imageAsset: 'resources/images/forbes_funding.png',
    source: 'The NY Times',
    date: DateTime(2023, 6, 9),
    publisher: forbes,
  ),
];

final forbesNews = <News>[
  News(
    id: 'biz-1',
    title: 'Tech Startup Secures \$50 Million Funding for Expansion',
    subtitle: 'Investors bet big on growth.',
    category: 'Business',
    imageAsset: 'resources/images/forbes_funding.png',
    source: 'Forbes',
    date: DateTime(2023, 6, 11),
    publisher: forbes,
  ),
];

