import 'package:bookly/Feature/Home/persentaion/home_view/Widgets/BestSellerItem.dart';
import 'package:bookly/Feature/Search/persentaion/manger/search_cubit.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:bookly/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
              child: Text(
            "Search.....",
            style: Styles.textStyle20,
          ));
        }
        if (state is SearchSuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsetsDirectional.only(top: 18),
            itemBuilder: (context, index) => SizedBox(
                child: BestSellerItem(
              model: state.books[index],
            )),
            separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
            itemCount: state.books.length,
          );
        } else if (state is SearchFailure) {
          return CustomError(errorMessage: state.errorMessage);
        }
        return const CustomLoading();
      },
    );
  }
}
