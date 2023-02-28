import 'package:bookly/Feature/Home/persentaion/manger/simailar_books_cubit/Similar_Book_Cubit.dart';
import 'package:bookly/Feature/Home/persentaion/manger/simailar_books_cubit/Similar_Book_Cubit.dart';
import 'package:bookly/Feature/Home/persentaion/widgets/custom_book_item.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBookCubit, SimilarBookState>(
      builder: (context, state) {
        if (state is SimilarBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).pushReplacement(
                            AppRouter.detailsView,
                            extra: state.books[index]);
                      },
                      child: CustomBookItem(model: state.books[index])),
                );
              },
            ),
          );
        } else if (state is SimilarBookFailure) {
          return CustomError(errorMessage: state.errorMessage);
        }
        return const CustomLoading();
      },
    );
  }
}
