import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../data/model/category.dart';

class AppCategory extends StatelessWidget {
  final Category category;
  const AppCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: category.color, borderRadius: category.borderRadius),
      child: Column(
        children: [
          Expanded(
              flex: 75,
              child: Image.asset(
                category.imagePath,
                height: MediaQuery.of(context).size.height * 0.15,
              )),
          Expanded(
              flex: 25,
              child: Text(
                category.text,
                style: GoogleFonts.getFont(
                    textStyle:
                    const TextStyle(color: Colors.white, fontSize: 22),
                    "Exo"),
              )),
        ],
      ),
    );
  }
}
