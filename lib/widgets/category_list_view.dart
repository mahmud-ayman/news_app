import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/category_cards.dart';

class CategoryListView extends StatelessWidget {
  final List<CategoryModel> categoriesList;
  final void Function(String cat) onCategorySelected;

  const CategoryListView({
    super.key,
    required this.categoriesList,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return CategoryCards(
            category: categoriesList[index],
            onCategorySelected: onCategorySelected,
          );
        },
      ),
    );
  }
}
