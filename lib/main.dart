import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

import 'services/news_provider.dart';
import 'services/news_service.dart';

void main() {
  final dio = Dio();

  runApp(
    ChangeNotifierProvider(
      create: (_) => NewsProvider(NewsService(dio))..fetchNews(),
      child: NewsApp(),
    ),
  );
}
