import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/features/movie/animations/opacity_tween.dart';
import 'package:flutter_movie_app/src/features/movie/animations/slideup_tween.dart';

class MoviesSearchBar extends StatelessWidget {
  const MoviesSearchBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;
  final TextStyle textStyle = const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: OpacityTween(
        child: SlideUpTween(
          begin: const Offset(-100, 0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.secundaryBackgroudColor,
            ),
            child: TextFormField(
              style: textStyle,
              decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.grey, size: 35),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
