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
            "https://www.google.com/imgres?q=photos&imgurl=https%3A%2F%2Fimages.unsplash.com%2Fphoto-1495745966610-2a67f2297e5e%3Ffm%3Djpg%26q%3D60%26w%3D3000%26ixlib%3Drb-4.1.0%26ixid%3DM3wxMjA3fDB8MHxzZWFyY2h8M3x8cGhvdG9ncmFwaGVyfGVufDB8fDB8fHww&imgrefurl=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fphotographer&docid=8ncfNjXWb262-M&tbnid=7gc14Qafc2ivEM&vet=12ahUKEwjBtoDWjIORAxWrVkEAHU-HGTIQM3oECCQQAA..i&w=3000&h=4500&hcb=2&ved=2ahUKEwjBtoDWjIORAxWrVkEAHU-HGTIQM3oECCQQAA",
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
