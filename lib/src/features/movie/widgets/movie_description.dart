import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/movie.dart';
import 'movie_detail_card.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 15);

    return Row(
      children: [
        _moviePhoto(movie),
        const SizedBox(width: 25),
        _cardDetails(movie, spacer)
      ],
    );
  }

  Widget _cardDetails(Movie movie, SizedBox spacer) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          MovieDetailCard(
            icon: Icons.video_camera_back,
            iconColor: Colors.white,
            iconSize: 35,
            primaryText: movie.gender,
            secundaryText: 'Genre',
          ),
          spacer,
          MovieDetailCard(
            icon: Icons.watch_later,
            iconColor: Colors.white,
            iconSize: 35,
            primaryText: movie.duractionMinutes,
            secundaryText: 'Duraction',
          ),
          spacer,
          MovieDetailCard(
            icon: Icons.star,
            iconColor: Colors.white,
            iconSize: 35,
            primaryText: movie.raiting.toString() + ' / 10',
            secundaryText: 'Raiting',
          ),
        ],
      ),
    );
  }

  Widget _moviePhoto(Movie movie) {
    return Expanded(
      flex: 4,
      child: Hero(
        tag: movie.picture,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/images/' + movie.picture),
            ),
          ),
        ),
      ),
    );
  }
}
