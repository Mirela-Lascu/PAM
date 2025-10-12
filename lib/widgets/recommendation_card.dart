import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/news.dart';
import '../pages/publisher_page.dart';
import 'category_tag.dart';

class RecommendationCard extends StatelessWidget {
  final News news;
  const RecommendationCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 12,
            offset: Offset(0, 4),
            color: Color(0x11000000),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header pt recomendation_card
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  forbes.logoAsset,
                  width: 28,
                  height: 28,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Forbes', style: TextStyle(fontWeight: FontWeight.w700)),
                      SizedBox(width: 6),
                      Icon(Icons.verified, size: 16, color: Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    formatShortDate(news.date),
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),

              const Spacer(),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    minimumSize: const Size(0, 32),
                    backgroundColor: const Color(0xFFF1F3F5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    visualDensity: VisualDensity.compact,
                  ),
                  child: const Text('Follow')),
              const SizedBox(width: 4),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                iconSize: 20,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            news.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 4),
          CategoryTag(news.category, style: CategoryTagStyle.white,),
          const SizedBox(height: 12),

          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              news.imageAsset,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          //buton pt pagina publisher_page
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.arrow_forward),
              label: const Text('See more from Forbes'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => PublisherPage(publisher: forbes),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}