import 'package:flutter/material.dart';
import '../models/publisher.dart';

class PublisherHeader extends StatelessWidget {
  final Publisher publisher;
  const PublisherHeader({super.key, required this.publisher});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),

            Expanded(
              child: Text(
                publisher.handle,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],
        ),

        const SizedBox(height: 6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Builder(
                builder: (context) {
                  final logo = publisher.logoAsset;

                  if (logo.isEmpty) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    );
                  }

                  if (logo.startsWith('http')) {
                    return Image.network(
                      logo,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.shade300,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }

                  return Image.asset(
                    logo,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    runSpacing: 2,
                    spacing: 24,
                    children: [
                      _StatItem(value: '${publisher.newsCount}k', label: 'News'),
                      _StatItem(value: '${publisher.followers}k', label: 'Followers'),
                      _StatItem(value: '${publisher.following}', label: 'Following'),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(250, 35),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text('Follow'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Text(
                publisher.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.verified, size: 18, color: Colors.blue),
          ],
        ),

        const SizedBox(height: 6),
        Text(
          publisher.about,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 19,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}