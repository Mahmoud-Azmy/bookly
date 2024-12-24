import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/sliding_logo.dart';
import 'package:my_bookly/Features/Splash/presentation/views/widgets/sliding_text.dart';
import 'package:my_bookly/core/utils/app_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> textAnimation;
  late Animation<Offset> logoaAimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHomeView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingLogo(logoaAimation: logoaAimation),
        const SizedBox(
          height: 5,
        ),
        SlidingText(textAnimation: textAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    textAnimation = Tween<Offset>(
      begin: const Offset(0, -5),
      end: const Offset(0, 0),
    ).animate(animationController);
    logoaAimation = Tween<Offset>(
      begin: const Offset(0, 3),
      end: const Offset(0, 0),
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToHomeView() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        GoRouter.of(context).push(AppRouter.kHomeView);
      }
    });
  }
}
