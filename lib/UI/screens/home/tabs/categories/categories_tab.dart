import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../data/model/category.dart';
import '../../../../utils/app_colors.dart';
import 'app_category.dart';

class CategoriesTab extends StatelessWidget {
  final Function(Category) onCategoryClick;
  const CategoriesTab(this.onCategoryClick, {super.key});

  static const String routeName = "categories";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pick your category",
                style: GoogleFonts.getFont(
                    textStyle: const TextStyle(
                        color: AppColors.mainTitle,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    "Poppins"),
                textAlign: TextAlign.right,
              ),
              Text(
                "of interest",
                style: GoogleFonts.getFont(
                    textStyle: const TextStyle(
                        color: AppColors.mainTitle,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    "Poppins"),
                textAlign: TextAlign.right,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: GridView.builder(
                    itemCount: Category.categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 20,
                            childAspectRatio: 1.9 / 2.2),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        onCategoryClick(Category.categories[index]);
                      },
                      child: AppCategory(
                        category: Category.categories[index],
                      ),
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
