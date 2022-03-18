import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/constants/constants.dart';
import 'widgets/widgets.dart';

class MoviesPages extends StatelessWidget {
  const MoviesPages({Key? key}) : super(key: key);

  final double spacerHight = 18;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return SafeArea(
          child: Container(
            color: AppColors.primaryBackgroudColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: const PreferredSize(
                  child: MoviesAppBar(),
                  preferredSize: Size.fromHeight(kToolbarHeight),
                ),
                backgroundColor: AppColors.primaryBackgroudColor,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: spacerHight),
                    MoviesSearchBar(height: h * 0.075),
                    SizedBox(height: spacerHight),
                    const MoviesCategories(),
                    SizedBox(height: spacerHight),
                    const Text(
                      'Showing this month',
                      style: titleSecound,
                    ),
                    const Expanded(
                      child: MoviesView(),
                    ),
                    //IdentifierMovieSelecter(),
                  ],
                ),
                bottomNavigationBar: const BottomBar(),
              ),
            ),
          ),
        );
      },
    );
  }
}
