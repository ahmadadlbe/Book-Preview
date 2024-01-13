import 'package:flutter/material.dart';

class AnimatedSplashWidget extends StatelessWidget {
  const AnimatedSplashWidget({
    super.key,
    required this.animationController,
    required this.slidingAnimation,
    required this.widget,
  });
  final Widget widget;
  final AnimationController animationController;
  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return SlideTransition(position: slidingAnimation, child: widget);
        });
  }
}
