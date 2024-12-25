import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/widgets/custom_error_message.dart';

class FeatuerdBooksListView extends StatelessWidget {
  const FeatuerdBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.27,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo?.imageLinks?.thumbnail ??
                          'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/1200px-Real_Madrid_CF.svg.png',
                      raduis: 16,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
