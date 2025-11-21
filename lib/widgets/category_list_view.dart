import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/category_cards.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key, required this.categoriesList});

  final List<CategoryModel> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,

        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return Category_cards(Categoryes: categoriesList[index]);
        },
      ),
    );
  }
}
