import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/movie.dart';
import 'package:flutter_movie_app/src/core/data/models/movie_date.dart';
import 'widgets.dart';

class MovieDates extends StatefulWidget {
  const MovieDates({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<MovieDates> createState() => _MovieDatesState();
}

class _MovieDatesState extends State<MovieDates> {
  final pageController =
      PageController(viewportFraction: 0.165, initialPage: 5);
  double? page = 0;

  void _listenScroll() {
    setState(() {
      page = pageController.page;
    });
  }

  @override
  void initState() {
    pageController.addListener(() {
      _listenScroll();
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _listenScroll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieDates = List.generate(
        31,
        (index) => MovieDate(
              'Mar',
              index + 1,
              widget.movie.dates.times,
            ));
    return SizedBox(
      height: 83,
      child: PageView.builder(
        onPageChanged: (page) {
          pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceOut,
          );
        },
        itemBuilder: (_, index) {
          double opacity = 1;
          if (pageController.position.haveDimensions) {
            opacity = index.toDouble() + 1 - (pageController.page!);
            opacity = (opacity).clamp(0, 2);
            if (opacity > 1) opacity = 0;
          }
          return MovieDateOval(
            opacity: opacity,
            date: movieDates[index],
            isSelected: index == page,
          );
        },
        itemCount: 31,
        controller: pageController,
      ),
    );
  }
}
