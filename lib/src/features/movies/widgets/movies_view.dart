import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/data/models/data.dart';
import 'package:flutter_movie_app/src/features/movie/animations/opacity_tween.dart';
import 'package:flutter_movie_app/src/features/movie/animations/slideup_tween.dart';
import 'package:flutter_movie_app/src/features/movie/movie_page.dart';
import 'package:flutter_movie_app/src/features/movies/widgets/movie_card.dart';

import 'indetifier_movie_selected.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  final _pageController =
      PageController(viewportFraction: 0.68, initialPage: 4);
  double? page = 0;

  void _listenScroll() {
    setState(() {
      page = _pageController.page;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _listenScroll();
    });
    _pageController.addListener(_listenScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenScroll);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: OpacityTween(
            child: SlideUpTween(
              begin: const Offset(0, 100),
              child: PageView.builder(
                pageSnapping: true,
                clipBehavior: Clip.none,
                controller: _pageController,
                itemCount: movies.length,
                onPageChanged: (page) => {
                  _pageController.animateToPage(
                    page,
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceOut,
                  )
                },
                itemBuilder: (_, index) {
                  final movie = movies[index];
                  double value = 0;
                  double valueTraslate = 0;
                  if (_pageController.position.haveDimensions) {
                    value = index.toDouble() - (_pageController.page!);
                    valueTraslate = index.toDouble() - (_pageController.page!);
                    value = (value * 0.03).clamp(-1, 1);
                  }
                  // Future.delayed(
                  //     const Duration(milliseconds: 50), () => _listenScroll());
                  return Transform.translate(
                    offset: Offset(0, 50 * valueTraslate.abs()),
                    child: Transform.rotate(
                      angle: pi * value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: GestureDetector(
                          child: Hero(
                            tag: movie.picture,
                            child: MovieCard(
                              movie: movie,
                            ),
                          ),
                          onTap: () {
                            const transitionDuration =
                                Duration(milliseconds: 700);
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                transitionDuration: transitionDuration,
                                reverseTransitionDuration: transitionDuration,
                                pageBuilder: (_, animation, ___) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: MoviePage(
                                      movie: movie,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IdentifierMovieSelecter(
            itemCount: movies.length,
            indexSelected: page!.round(),
          ),
        ),
      ],
    );
  }
}
