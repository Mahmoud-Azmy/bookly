import 'package:flutter/material.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/book_preview.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:my_bookly/core/utils/styles.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 30, right: 30),
          child: CustomBookDetailsAppBarr(),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .16),
                        child: const CustomBookImage(
                          imageUrl:
                              'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/1200px-Real_Madrid_CF.svg.png',
                          raduis: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * .13),
                        child: const Text(
                          'Harry Potter ',
                          maxLines: 2,
                          style: Styles.textStyle30,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'J.K. Rowling',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Styles.textStyle18.copyWith(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const BookRating(),
                      const SizedBox(
                        height: 15,
                      ),
                      const BookPreview(),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'You can also like',
                          style: Styles.textStyle14.copyWith(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SimilarBooksListView(),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
