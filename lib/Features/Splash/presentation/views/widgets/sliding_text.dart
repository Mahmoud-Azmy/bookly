import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.textAnimation,
  });

  final Animation<Offset> textAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: textAnimation,
          child: Text(
            'Read Free Books',
            style: Styles.textStyle18.copyWith(color: Colors.orange),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
