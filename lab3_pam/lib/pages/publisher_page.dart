import 'package:flutter/material.dart';

import '../data/news_repository.dart';
import '../models/publisher.dart';
import '../widgets/publisher_header.dart';
import '../widgets/news_card.dart';
import '../widgets/recommendation_card.dart';

class PublisherPage extends StatefulWidget {
  const PublisherPage({super.key});

  @override
  State<PublisherPage> createState() => _PublisherPageState();
}

class _PublisherPageState extends State<PublisherPage> {
  bool grid = true;
  String sort = 'Newest';
  String query = '';

  late final NewsRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = NewsRepository();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PublisherDetails>(
      future: _repository.loadPublisherDetails(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: const Color(0xFFF7F9FC),
              body: Center(
                child: Text(
                  'Eroare la încărcarea detaliilor:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return const Scaffold(
            backgroundColor: Color(0xFFF7F9FC),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final details = snapshot.data!;
        final Publisher publisher = details.publisher;

        final filtered = details.news
            .where((n) => n.title.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return Scaffold(
          backgroundColor: const Color(0xFFF7F9FC),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
              children: [
                PublisherHeader(publisher: publisher),
                const SizedBox(height: 14),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Text(
                        'News from ${publisher.name}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      const Spacer(),
                      DropdownButton<String>(
                        value: sort,
                        underline: const SizedBox.shrink(),
                        items: const [
                          DropdownMenuItem(
                              value: 'Newest', child: Text('Newest')),
                          DropdownMenuItem(
                              value: 'Oldest', child: Text('Oldest')),
                        ],
                        onChanged: (v) =>
                            setState(() => sort = v ?? 'Newest'),
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

                const SizedBox(height: 10),
                TextField(
                  onChanged: (v) => setState(() => query = v),
                  decoration: InputDecoration(
                    hintText: 'Search in ${publisher.name} news',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                if (!grid && filtered.isNotEmpty)
                  RecommendationCard(news: filtered.first)
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filtered.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 240,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (_, i) =>
                        NewsCard(news: filtered[i], width: double.infinity),
                  ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}