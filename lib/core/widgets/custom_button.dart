import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      required this.borderRadius,
      this.onPressed});
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadius borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 55,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle18
                .copyWith(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
