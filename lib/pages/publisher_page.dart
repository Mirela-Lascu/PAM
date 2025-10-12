import 'package:flutter/material.dart';
import 'package:lab2_pam/widgets/recommendation_card.dart';
import '../data/mock_data.dart';
import '../models/publisher.dart';
import '../widgets/publisher_header.dart';
import '../widgets/news_card.dart';

class PublisherPage extends StatefulWidget {
  final Publisher publisher;
  const PublisherPage({super.key, required this.publisher});

  @override
  State<PublisherPage> createState() => _PublisherPageState();
}

class _PublisherPageState extends State<PublisherPage> {
  bool grid = false;
  String sort = 'Newest';
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = forbesNews
        .where((n) => n.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
          children: [
            PublisherHeader(publisher: widget.publisher),
            const SizedBox(height: 14),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                children: [
                  Text(
                    'News by ${widget.publisher.name}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  DropdownButton<String>(
                    value: sort,
                    underline: const SizedBox.shrink(),
                    items: const [
                      DropdownMenuItem(value: 'Newest', child: Text('Newest')),
                      DropdownMenuItem(value: 'Oldest', child: Text('Oldest')),
                    ],
                    onChanged: (v) => setState(() => sort = v ?? 'Newest'),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => setState(() => grid = false),
                    icon: Icon(
                      Icons.view_agenda_rounded,
                      color: grid ? Colors.grey : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => setState(() => grid = true),
                    icon: Icon(
                      Icons.grid_view_rounded,
                      color: grid ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),

            TextField(
              onChanged: (text) => setState(() => query = text),
              decoration: InputDecoration(
                hintText: 'Search "News"',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),

            const SizedBox(height: 12),
            if (!grid)
              RecommendationCard(news: forbesNews.first)
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 240,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, i) => NewsCard(news: filtered[i], width: double.infinity),
              ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}