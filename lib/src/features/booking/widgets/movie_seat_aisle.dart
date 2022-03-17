import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/seat.dart';
import 'widgets.dart';

class MovieSeatSection extends StatelessWidget {
  const MovieSeatSection({
    Key? key,
    required this.seats,
  }) : super(key: key);

  final List<Seat> seats;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: seats.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (_, index) {
            final seat = seats[index];
            return MovieSeatCard(seat: seat);
          },
        ),
      ),
    );
  }
}
