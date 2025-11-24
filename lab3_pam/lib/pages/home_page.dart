import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import '../bloc/home/home_state.dart';
import '../widgets/news_card.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial || state is HomeLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is HomeLoadFailure) {
              return Center(
                child: Text(
                  'Eroare la încărcarea datelor:\n${state.message}',
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is HomeLoadSuccess) {
              final data = state.data;
              final user = data.user;
              final trending = data.trending;
              final recommendations = data.recommendations;

              return ListView(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: [
                        _RoundIconButton(
                          icon: Icons.menu,
                          onTap: () {},
                        ),
                        const Spacer(),
                        _RoundIconButton(
                          icon: Icons.notifications_none,
                          onTap: () {},
                        ),
                        const SizedBox(width: 8),
                        _RoundIconButton(
                          icon: Icons.person_outline,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back, ${user.name}!',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'You have ${user.notificationCount} new notifications',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),

                  const SectionHeader(
                    title: 'Trending news',
                    actionText: 'See all',
                  ),

                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 16, right: 4, bottom: 8),
                      scrollDirection: Axis.horizontal,
                      itemCount: trending.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: NewsCard(
                            news: trending[index],
                            width: 260,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 8),

                  const SectionHeader(
                    title: 'Recommendation',
                  ),

                  if (recommendations.isNotEmpty)
                    RecommendationCard(news: recommendations.first),

                  const SizedBox(height: 30),
                ],
              );
            }

            return const SizedBox.shrink();
          },
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