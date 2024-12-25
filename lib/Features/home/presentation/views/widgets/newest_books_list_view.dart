import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/custom_book_list_view_item.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/widgets/custom_error_message.dart';

class NewsetBooksListView extends StatelessWidget {
  const NewsetBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.books.length,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: GestureDetector(
                  child: CustomBookListViewItem(
                    bookModel: state.books[index],
                  ),
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,
                        extra: state.books[index]);
                  },
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
