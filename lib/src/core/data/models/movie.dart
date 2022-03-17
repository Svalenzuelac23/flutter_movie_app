import 'cinema_location.dart';
import 'movie_date.dart';

class Movie {
  final String name;
  final String synopsis;
  final String picture;
  final String gender;
  final String duractionMinutes;
  final double raiting;
  final Location location;
  final MovieDate dates;

  Movie({
    required this.name,
    required this.synopsis,
    required this.picture,
    required this.gender,
    required this.duractionMinutes,
    required this.raiting,
    required this.location,
    required this.dates,
  });
}
