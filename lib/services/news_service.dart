import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  String cat = "general";

  void setCategory(String newCat) {
    cat = newCat;
  }

  Future<List<Article>> getNews({String? category}) async {
    try {
      final String url =
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=2a9eef5555b9449eb44d1e7e2e17d117&category=${category ?? cat}";

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        List articlesJson = response.data["articles"];
        return articlesJson.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception("Error fetching news");
      }
    } catch (e) {
      print("API ERROR: $e");
      throw Exception("Error fetching news");
    }
  }
}
