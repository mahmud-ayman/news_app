import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';

class NewsTile extends StatelessWidget {
  final Article article;

  const NewsTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: article.imageUrl.isNotEmpty
                  ? Image.network(
                      article.imageUrl,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey,
                          child: const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.white,
                          ),
                        );
                      },
                    )
                  : Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.grey,
                      child: const Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
            ),
            const SizedBox(height: 8),
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              article.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(179, 133, 133, 133),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
