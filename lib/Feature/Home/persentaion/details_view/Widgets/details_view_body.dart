import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:bookly/Feature/Home/persentaion/details_view/Widgets/CustomDetailsAppBar.dart';
import 'package:bookly/Feature/Home/persentaion/widgets/book_rate_view.dart';
import 'package:bookly/Feature/Home/persentaion/widgets/custom_book_item.dart';
import 'package:bookly/Feature/Home/persentaion/widgets/custom_buttons_view.dart';
import 'package:bookly/Feature/Home/persentaion/details_view/Widgets/similar_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CustomDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.18, vertical: 20),
                  child: CustomBookItem(model: bookModel),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                Text(
                  bookModel.volumeInfo!.title!,
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    bookModel.volumeInfo!.authors!.first,
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                BookRate(
                    mainAxisAlignment: MainAxisAlignment.center,
                    avrageRate: bookModel.volumeInfo!.averageRating.toString(),
                    publishDate:
                        bookModel.volumeInfo!.publishedDate!.substring(0, 4)),
                SizedBox(height: height * .04),
                CustomButtons(bookModel: bookModel),
                SizedBox(height: height * .06),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SimilarBooksListView()),
        ],
      ),
    );
  }
}
