import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home/home_bloc.dart';
import 'bloc/home/home_event.dart';
import 'data/news_repository.dart';
import 'pages/home_page.dart';

void main() {
  final repository = NewsRepository();

  runApp(
    BlocProvider(
      create: (_) => HomeBloc(repository)..add(const HomeRequested()),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4C9AFF)),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}