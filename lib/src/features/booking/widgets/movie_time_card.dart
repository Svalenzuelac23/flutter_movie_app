import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';

class MovieTimeCard extends StatelessWidget {
  const MovieTimeCard({
    Key? key,
    required this.time,
    required this.isSelected,
  }) : super(key: key);

  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorText = isSelected ? AppColors.principalColor : Colors.grey;
    final colorBorder =
        isSelected ? AppColors.principalColor : Colors.transparent;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
          border: Border.all(
            color: colorBorder,
          ),
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              color: colorText,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
