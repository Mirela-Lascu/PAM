import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../widgets/news_card.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final greeting = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back, Tyler!',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Discover a world of news that matters to you',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
              child: Row(
                children: [
                  _RoundIconButton(icon: Icons.menu, onTap: () {}),
                  const Spacer(),
                  _RoundIconButton(icon: Icons.notifications_none, onTap: () {}),
                  const SizedBox(width: 8),
                  _RoundIconButton(
                    icon: Icons.person_outline,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: greeting,
            ),

            const SectionHeader(title: 'Trending news', actionText: 'See all'),
            SizedBox(
              height: 220,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 16, right: 4),
                scrollDirection: Axis.horizontal,
                itemCount: trendingNews.length,
                itemBuilder: (context, index) {
                  return NewsCard(news: trendingNews[index], width: 260);
                },
              ),
            ),
            const SizedBox(height: 8),

            const SectionHeader(title: 'Recommendation'),
            RecommendationCard(news: forbesNews.first),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _RoundIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 3),
              color: Color(0x11000000),
            ),
          ],
        ),
        child: Icon(icon),
      ),
    );
  }
}