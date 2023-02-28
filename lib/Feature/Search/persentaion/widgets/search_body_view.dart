import 'package:bookly/Feature/Search/persentaion/widgets/search_books_list_view.dart';
import 'package:bookly/Feature/Search/persentaion/widgets/CustomSearchBar.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SearchBodyView extends StatelessWidget {
  const SearchBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .055),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchBar(),
          SizedBox(
            height: 18,
          ),
          Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(child: SearchBooksListView()),
        ],
      ),
    );
  }
}
