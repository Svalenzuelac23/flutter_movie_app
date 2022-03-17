import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/features/movie/animations/opacity_tween.dart';
import 'package:flutter_movie_app/src/features/movie/animations/slideup_tween.dart';

class MovieDetailCard extends StatelessWidget {
  const MovieDetailCard({
    Key? key,
    required this.iconColor,
    required this.iconSize,
    required this.secundaryText,
    required this.primaryText,
    required this.icon,
  }) : super(key: key);

  final Color iconColor;
  final double iconSize;
  final String secundaryText;
  final String primaryText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OpacityTween(
        child: SlideUpTween(
          begin: const Offset(-100, 0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.grey[800]!,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //color: Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.25),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      secundaryText,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      primaryText,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
