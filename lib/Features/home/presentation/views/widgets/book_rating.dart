import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bookly/core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffffdd4f),
          size: 18,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          '4.5',
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          '(567)',
          style: Styles.textStyle14,
        )
      ],
    );
  }
}
