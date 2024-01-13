import 'package:booklyapp/Features/Splash/view/widget/animated_splash.dart';
import 'package:booklyapp/core/utils/app_router.dart';

import 'package:booklyapp/core/utils/asset_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    initAnimationController();
    navigatToHome();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedSplashWidget(
            widget: Image.asset(AssitImages.logo),
            animationController: animationController,
            slidingAnimation: slidingAnimation),
      ],
    );
  }

  void navigatToHome() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.homeView);
      },
    );
  }

  void initAnimationController() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    slidingAnimation.addListener(() {
      setState(() {});
    });
  }
}
