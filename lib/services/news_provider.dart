import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  final NewsService newsService;

  NewsProvider(this.newsService);

  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> fetchNews() async {
    try {
      isLoading = true;
      notifyListeners();

      articles = await newsService.getNews();
      errorMessage = null;
    } catch (e) {
      errorMessage = "حدث خطأ أثناء تحميل الأخبار";
    }

    isLoading = false;
    notifyListeners();
  }
}
