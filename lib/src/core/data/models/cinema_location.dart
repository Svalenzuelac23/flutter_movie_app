import 'package:flutter_movie_app/src/core/data/models/section_seat.dart';

class Location {
  final String name;
  final int ailes;
  final List<SeatSection> sections;

  Location({
    required this.name,
    required this.ailes,
    required this.sections,
  });
}
