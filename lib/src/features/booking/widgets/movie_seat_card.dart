import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/data/models/seat.dart';

class MovieSeatCard extends StatefulWidget {
  const MovieSeatCard({
    Key? key,
    required this.seat,
  }) : super(key: key);

  final Seat seat;

  @override
  State<MovieSeatCard> createState() => _MovieSeatCardState();
}

class _MovieSeatCardState extends State<MovieSeatCard> {
  @override
  Widget build(BuildContext context) {
    final color = widget.seat.isHidden
        ? AppColors.primaryBackgroudColor
        : widget.seat.isBusy
            ? Colors.white
            : widget.seat.isSelected
                ? AppColors.principalColor
                : AppColors.secundaryBackgroudColor;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.seat.isSelected = !widget.seat.isSelected;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
