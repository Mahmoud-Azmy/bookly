import 'package:flutter/material.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';

class BookPreview extends StatelessWidget {
  const BookPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomButton(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          text: r'18.99$',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        CustomButton(
          backgroundColor: Color(0xffef8262),
          textColor: Colors.white,
          text: 'Free Preview',
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ],
    );
  }
}
