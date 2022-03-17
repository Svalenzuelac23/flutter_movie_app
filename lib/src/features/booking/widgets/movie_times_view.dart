import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/movie.dart';
import 'widgets.dart';

class MovieTimes extends StatefulWidget {
  const MovieTimes({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<MovieTimes> createState() => _MovieTimesState();
}

class _MovieTimesState extends State<MovieTimes> {
  final pageController = PageController(viewportFraction: 0.19, initialPage: 3);
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _listenScroll();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: PageView.builder(
        controller: pageController,
        itemCount: widget.movie.dates.times.length,
        itemBuilder: (_, index) {
          return MovieTimeCard(
            time: widget.movie.dates.times[index],
            isSelected: page == index,
          );
        },
        onPageChanged: (page) {
          pageController.animateToPage(
            page,
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceOut,
          );
        },
      ),
    );
  }
}
