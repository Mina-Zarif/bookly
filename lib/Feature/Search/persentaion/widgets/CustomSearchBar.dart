import 'package:bookly/Feature/Search/persentaion/manger/search_cubit.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder: (context, state) {
        SearchCubit cubit = BlocProvider.of(context);
        return Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.1,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: TextFormField(
            onChanged: (value) {
              cubit.fetchSearchBooks(value);
            },
            decoration: InputDecoration(
                suffixIcon: Image.asset(AssetsApp.searchIcon),
                hintText: " Search...",
                prefix: const SizedBox(
                  width: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
        );
      },
    );
  }
}
