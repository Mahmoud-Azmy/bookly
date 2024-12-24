import 'package:flutter/material.dart';
import 'package:my_bookly/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:my_bookly/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:my_bookly/core/utils/styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(
            height: 20,
          ),
          Text(
            'Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SearchResultListView(),
          )
        ],
      ),
    );
  }
}
