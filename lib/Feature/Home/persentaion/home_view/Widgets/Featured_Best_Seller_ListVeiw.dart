import 'package:bookly/Feature/Home/persentaion/manger/newest_books/newest_books_cubit.dart';
import 'package:bookly/Feature/Home/persentaion/home_view/Widgets/BestSellerItem.dart';
import 'package:bookly/Feature/Home/persentaion/widgets/CustomBookItemShimmer.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedBestSellerListVeiw extends StatelessWidget {
  const FeaturedBestSellerListVeiw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsetsDirectional.only(top: 20),
            itemBuilder: (context, index) =>
                BestSellerItem(model: state.books[index]),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: state.books.length,
          );
        } else if (state is NewestBooksFailure) {
          return CustomError(
            errorMessage: state.errorMessage,
          );
        }
        return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const ShimmerScreen());
      },
    );
  }
}

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            leading: Container(
              width: 50,
              height: 100,
              color: Colors.grey[700],
            ),
            title: Container(
              width: double.infinity,
              height: 16,
              color: Colors.grey[700],
            ),
            subtitle: Container(
              width: double.infinity,
              height: 16,
              color: Colors.grey[700],
            ),
          ),
        );
      },
      itemCount: 7,
    );
  }
}
