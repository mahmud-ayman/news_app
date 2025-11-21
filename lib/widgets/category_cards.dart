import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';

class Category_cards extends StatelessWidget {
  Category_cards({super.key, required this.Categoryes});
  CategoryModel Categoryes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        height: 90,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: const Color.fromARGB(255, 0, 0, 0))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Image.asset(
                  Categoryes.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Center(
                  child: Text(
                    Categoryes.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
