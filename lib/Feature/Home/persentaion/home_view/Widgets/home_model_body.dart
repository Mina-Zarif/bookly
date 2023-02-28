import 'package:bookly/Feature/Home/persentaion/home_view/Widgets/custom_app_bar.dart';
import 'package:bookly/Feature/Home/persentaion/home_view/Widgets/Featured_Best_Seller_ListVeiw.dart';
import 'package:bookly/Feature/Home/persentaion/home_view/Widgets/featured_books_list_view.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeModelBody extends StatelessWidget {
  const HomeModelBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .055),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomAppBar(),
                CustomBooksListView(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Best Seller",
                  style: Styles.textStyle18,
                ),
                FeaturedBestSellerListVeiw(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
