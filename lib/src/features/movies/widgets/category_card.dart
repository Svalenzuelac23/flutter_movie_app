import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/data/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
    required this.width,
  }) : super(key: key);

  final Category category;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.secundaryBackgroudColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              category.icon,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          category.name,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
