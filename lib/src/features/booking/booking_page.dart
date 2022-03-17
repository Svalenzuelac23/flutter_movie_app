import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_colors.dart';
import 'package:flutter_movie_app/src/core/data/models/data.dart';
import 'package:flutter_movie_app/src/core/data/models/movie.dart';
import 'package:flutter_movie_app/src/features/booking/animations/buttom_size_animation.dart';
import 'package:flutter_movie_app/src/features/booking/animations/opacity_animation.dart';
import 'widgets/widgets.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with TickerProviderStateMixin {
  late ButtomSizeAnimationController controller;

  final movie = movies.first;

  @override
  void initState() {
    controller = ButtomSizeAnimationController(
      contentController: AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 750,
          )),
      buttonController: AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 750,
        ),
      ),
    );
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await controller.buttonController.forward();
      await controller.buttonController.reverse();
      await controller.contentController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            child: OpacityAnimation(
              animation: controller.inicialOpacityAnimation,
              child: const CustomAppBar(),
            ),
            preferredSize: const Size.fromHeight(kToolbarHeight),
          ),
          backgroundColor: AppColors.primaryBackgroudColor,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                width: w,
                child: Column(
                  children: [
                    OpacityAnimation(
                      animation: controller.inicialOpacityAnimation,
                      child: _CinemaLayout(h: h, w: w, movie: movie),
                    ),
                    OpacityAnimation(
                      animation: controller.endOpatictyAnimation,
                      child: _ButtomPage(height: h * 0.42, movie: movie),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                //left: (w - w * 0.6) / 2,
                child: _ScaleButton(controller: controller, w: w, h: h),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScaleButton extends StatelessWidget {
  const _ScaleButton({
    Key? key,
    required this.controller,
    required this.w,
    required this.h,
  }) : super(key: key);

  final ButtomSizeAnimationController controller;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.buttonController,
      builder: (_, child) {
        final size = controller
            .buttonSizeAnimation(
              begin: Size(w * 0.0, h * 0.0),
              end: Size(w * 1.2, h * 1.1),
            )
            .value;
        final margin = controller.buttomMarginAnimation((h) * 0.02).value;

        return Center(
          child: Container(
            margin: EdgeInsets.only(bottom: margin),
            decoration: BoxDecoration(
                color: AppColors.principalColor,
                borderRadius: BorderRadius.circular(50)),
            height: size.height,
            width: size.width,
            // height: h * 0.08,
            // width: w * 0.6,
          ),
        );
      },
    );
  }
}

class _CinemaLayout extends StatelessWidget {
  const _CinemaLayout({
    Key? key,
    required this.h,
    required this.w,
    required this.movie,
  }) : super(key: key);

  final double h;
  final double w;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: kToolbarHeight * 1.6, right: 25, left: 25),
      child: Column(
        children: [
          SizedBox(
            height: h * 0.06,
            width: w,
            child: CustomPaint(
              painter: ScreenPainter(),
            ),
          ),
          SizedBox(height: h * 0.03),
          SizedBox(
            width: w,
            child: MovieCinema(
              cinema: movie.location,
            ),
          ),
          SizedBox(height: h * 0.02),
          const MovieSeatlabels(),
          SizedBox(height: h * 0.03),
        ],
      ),
    );
  }
}

class _ButtomPage extends StatelessWidget {
  const _ButtomPage({
    Key? key,
    required this.height,
    required this.movie,
  }) : super(key: key);

  final double height;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.secundaryBackgroudColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 22),
          const Text(
            'Select Date and Time',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 30),
          MovieDates(
            movie: movie,
          ),
          const SizedBox(height: 15),
          MovieTimes(
            movie: movie,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 25, left: 25, top: 30, bottom: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '\$43.55',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: const Center(
                      child: Text(
                        'Book Ticket',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.principalColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    // height: h * 0.08,
                    width: 200,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
