import 'package:flutter/material.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BookPreview extends StatelessWidget {
  const BookPreview({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomButton(
          backgroundColor: Colors.white,
          textColor: Colors.black,
          text: r'18.99$',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        CustomButton(
          onPressed: () async {
            Uri url = Uri.parse(bookModel.volumeInfo?.previewLink ?? '');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          backgroundColor: const Color(0xffef8262),
          textColor: Colors.white,
          text: 'Free Preview',
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
      ],
    );
  }
}
