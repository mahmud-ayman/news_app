import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/category_list_view.dart';
import 'package:news_app/widgets/news_tile.dart';
import 'package:news_app/services/news_service.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  final List<CategoryModel> categoriesList = [
    CategoryModel(
      name: 'Business',
      image: 'assets/business.avif',
      cat: 'business',
    ),
    CategoryModel(
      name: 'Entertainment',
      image: 'assets/entertaiment.avif',
      cat: 'entertainment',
    ),
    CategoryModel(
      name: 'General',
      image: 'assets/general.avif',
      cat: 'general',
    ),
    CategoryModel(name: 'Health', image: 'assets/health.avif', cat: 'health'),
    CategoryModel(
      name: 'Science',
      image: 'assets/science.avif',
      cat: 'science',
    ),
    CategoryModel(name: 'Sports', image: 'assets/sports.avif', cat: 'sports'),
    CategoryModel(
      name: 'Technology',
      image: 'assets/technology.jpeg',
      cat: 'technology',
    ),
  ];

  String selectedCategory = 'general';
  List<Article> articles = [];
  bool isLoading = true;
  String? errorMessage;

  final Dio dio = Dio();
  late final NewsService newsService;

  @override
  void initState() {
    super.initState();
    newsService = NewsService(dio);
    fetchNews();
  }

  Future<void> fetchNews() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      articles = await newsService.getNews(category: selectedCategory);
    } catch (e) {
      errorMessage = 'Error fetching news: $e';
    }

    setState(() {
      isLoading = false;
    });
  }

  void onCategorySelected(String cat) {
    selectedCategory = cat;
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 52, 70, 79),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('News'),
              Text(
                'Void',
                style: TextStyle(color: Color.fromARGB(255, 33, 243, 208)),
              ),
            ],
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
          elevation: 7,
          shadowColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(7.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CategoryListView(
                  categoriesList: categoriesList,
                  onCategorySelected: onCategorySelected,
                ),
              ),
              if (isLoading)
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              else if (errorMessage != null)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final article = articles[index];
                    return NewsTile(article: article);
                  }, childCount: articles.length),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
