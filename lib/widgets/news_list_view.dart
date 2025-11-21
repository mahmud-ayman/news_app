import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_tile.dart';

class NewsTileListView extends StatelessWidget {
  const NewsTileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
          return NewsTile();
        }),
      ),
    );
  }
}
