import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets.dart';

class SlidingLogo extends StatelessWidget {
  const SlidingLogo({
    super.key,
    required this.logoaAimation,
  });

  final Animation<Offset> logoaAimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: logoaAimation,
      builder: (context, child) {
        return SlideTransition(
          position: logoaAimation,
          child: Image.asset(AssetsData.logo),
        );
      },
    );
  }
}
