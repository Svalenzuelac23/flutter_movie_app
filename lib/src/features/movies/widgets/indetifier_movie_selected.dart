import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';

class IdentifierMovieSelecter extends StatelessWidget {
  const IdentifierMovieSelecter({
    Key? key,
    required this.itemCount,
    required this.indexSelected,
  }) : super(key: key);

  final int itemCount;
  final int indexSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _createListDots(itemCount, indexSelected),
        ));
  }

  Widget _identifierMovie(double width, double height, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: isSelected ? width * 2.5 : width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? AppColors.principalColor : Colors.grey[600],
        ),
      ),
    );
  }

  List<Widget> _createListDots(int itemCount, int indexSelected) {
    return List.generate(
      itemCount,
      (index) => _identifierMovie(12, 12, index == indexSelected),
    );
  }
}
