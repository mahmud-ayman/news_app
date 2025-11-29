import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class CategoryCards extends StatelessWidget {
  final CategoryModel category;
  final void Function(String cat) onCategorySelected;

  const CategoryCards({
    super.key,
    required this.category,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => onCategorySelected(category.cat),
        child: Container(
          height: 90,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 4),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Image.asset(
                    category.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Center(
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
