import 'package:flutter/material.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:my_bookly/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:my_bookly/core/utils/styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FeatuerdBooksListView(),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Newest Books',
                        style: Styles.textStyle18,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: NewsetBooksListView(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
