import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/category_cards.dart';
import 'package:news_app/widgets/newstile.dart';

class NewsApp extends StatelessWidget {
  NewsApp({super.key});

  List<CategoryModel> categoriesList = [
    CategoryModel(name: 'Business', image: 'assets/business.avif'),
    CategoryModel(name: 'Entertainment', image: 'assets/entertaiment.avif'),
    CategoryModel(name: 'General', image: 'assets/general.avif'),
    CategoryModel(name: 'Health', image: 'assets/health.avif'),
    CategoryModel(name: 'Science', image: 'assets/science.avif'),
    CategoryModel(name: 'Sports', image: 'assets/sports.avif'),
    CategoryModel(name: 'Technology', image: 'assets/technology.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 52, 70, 79),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          elevation: 7,
          shadowColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("News"),
              Text(
                "App",
                style: TextStyle(
                  color: const Color.fromARGB(255, 243, 226, 33),
                ),
              ),
            ],
          ),
        ),
        body: SizedBox(height: 80, child: Newstile()),
      ),
    );
  }
}
