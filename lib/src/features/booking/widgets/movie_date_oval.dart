import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/data/models/movie_date.dart';

class MovieDateOval extends StatelessWidget {
  const MovieDateOval({
    Key? key,
    required this.date,
    required this.isSelected,
    required this.opacity,
  }) : super(key: key);

  final MovieDate date;
  final bool isSelected;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.principalColor : Colors.black12;
    final colorNumber = isSelected ? Colors.white : Colors.transparent;
    final colorText = isSelected ? Colors.black : Colors.grey;
    final colorMonth = isSelected ? Colors.white : Colors.grey;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              date.month,
              style: TextStyle(
                color: colorMonth,
                fontSize: 14,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: Center(
                  child: Text(
                date.dayOfMonth.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: colorText),
              )),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorNumber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
