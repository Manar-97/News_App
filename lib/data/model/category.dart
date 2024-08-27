import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../UI/utils/app_colors.dart';

class Category {
   String backEndId;
   String imagePath;
   String text;
   Color color;
   BorderRadius borderRadius;
  Category(
      {required this.backEndId,
      required this.imagePath,
      required this.color,
      required this.text,
      required this.borderRadius,});

  static List<Category> categories = [
    Category(
        imagePath: 'assets/ball.png',
        color: AppColors.red,
        text: 'Sports',
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40)),
        backEndId: 'sports'),
    Category(
        imagePath: 'assets/Politics.png',
        color: AppColors.blue,
        text: 'technology',
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40)),
        backEndId: 'technology'),
    Category(
        imagePath: 'assets/health.png',
        color: AppColors.pink,
        text: 'Health',
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40)),
        backEndId: 'health'),
    Category(
        imagePath: 'assets/bussines.png',
        color: AppColors.brown,
        text: 'Bussines',
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40)),
        backEndId: 'business'),
    Category(
        imagePath: 'assets/environment.png',
        color: AppColors.niley,
        text: 'Entertainment',
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40)),
        backEndId: 'entertainment'),
    Category(
        imagePath: 'assets/science.png',
        color: AppColors.yellow,
        text: 'Science',
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40)),
        backEndId: 'science'),
  ];

  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        child: Column(
          children: [
            Expanded(flex: 75, child: Image.asset(imagePath)),
            Expanded(
                flex: 25,
                child: Text(
                  text,
                  style: GoogleFonts.getFont(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 22),
                      "Exo"),
                )),
          ],
        ),
      ),
    );
  }
}
