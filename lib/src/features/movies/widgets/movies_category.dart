import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/constants/constants.dart';
import 'package:flutter_movie_app/src/features/movies/widgets/categories_bar.dart';

class MoviesCategories extends StatelessWidget {
  const MoviesCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Category',
              style: titleSecound,
            ),
            Row(
              children: const [
                Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.principalColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.principalColor,
                  size: 12,
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 15),
        const CategoriesBar(),
      ],
    );
  }
}
