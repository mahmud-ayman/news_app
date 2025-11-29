import 'package:flutter/material.dart';
import 'package:news_app/services/news_provider.dart';
import 'package:provider/provider.dart';
import 'news_tile.dart';

class NewsTileListView extends StatelessWidget {
  const NewsTileListView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);

    if (provider.isLoading) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (provider.errorMessage != null) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              provider.errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final article = provider.articles[index];
        return NewsTile(article: article);
      }, childCount: provider.articles.length),
    );
  }
}
