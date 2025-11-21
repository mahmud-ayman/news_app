import 'package:flutter/material.dart';

class Newstile extends StatelessWidget {
  const Newstile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
          child: Image.network(
            " https://pub.dev/documentation/blur_container/latest/",
          ),
        ),
        const SizedBox(height: 4),

        Text(
          "Sample Text",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          "Sample Text",
          style: TextStyle(
            color: const Color.fromARGB(179, 133, 133, 133),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
