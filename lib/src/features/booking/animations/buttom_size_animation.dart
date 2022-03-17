import 'package:flutter/material.dart';

class ButtomSizeAnimationController {
  ButtomSizeAnimationController({
    required this.buttonController,
    required this.contentController,
  })  : inicialOpacityAnimation =
            Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
          parent: contentController,
          curve: const Interval(0.1, 1, curve: Curves.fastOutSlowIn),
        )),
        endOpatictyAnimation = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: contentController,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn),
          ),
        );

  final AnimationController buttonController;
  final AnimationController contentController;
  final Animation<double> inicialOpacityAnimation;
  final Animation<double> endOpatictyAnimation;

  Animation<Size> buttonSizeAnimation({
    required Size begin,
    required Size end,
  }) =>
      Tween<Size>(begin: begin, end: end).animate(CurvedAnimation(
        parent: buttonController,
        curve: Curves.fastOutSlowIn,
      ));

  Animation<double> buttomMarginAnimation(double begin) =>
      Tween<double>(begin: begin, end: 0.0).animate(buttonController);

  dispose() {
    buttonController.dispose();
    contentController.dispose();
  }
}
