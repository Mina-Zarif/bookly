import 'package:bookly/Feature/Home/persentaion/home_view/Widgets/BestSellerItem.dart';
import 'package:bookly/Feature/Home/persentaion/home_view/Widgets/Featured_Best_Seller_ListVeiw.dart';
import 'package:bookly/Feature/Search/persentaion/widgets/CustomSearchBar.dart';
import 'package:bookly/Feature/Search/persentaion/widgets/search_body_view.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchBodyView()
      ),
    );
  }
}


