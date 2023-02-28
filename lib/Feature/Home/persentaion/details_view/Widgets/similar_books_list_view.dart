import 'package:bookly/Feature/Home/persentaion/details_view/Widgets/similar-books-listview.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height * .0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You can also like",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .019,
          ),
          const SimilarBooksListview(),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }
}
