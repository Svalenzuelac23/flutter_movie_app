import 'package:flutter/cupertino.dart';

class OpacityAnimation extends AnimatedWidget {
  const OpacityAnimation({
    Key? key,
    required Animation animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  final Widget child;

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: progress.value,
      child: child,
    );
  }
}
