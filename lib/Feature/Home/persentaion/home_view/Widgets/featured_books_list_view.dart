import 'package:bookly/Feature/Home/persentaion/manger/featurs_cubit/featureas_books_cubit.dart';
import 'package:bookly/Feature/Home/persentaion/widgets/CustomBookItemShimmer.dart';
import 'package:bookly/core/widgets/custom_error.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CustomBooksListView extends StatelessWidget {
  const CustomBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturesBooksCubit, FeaturesBooksState>(
      builder: (context, state) {
        if (state is FeaturesBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: CarouselSlider(
              items: state.books
                  .map((e) => Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                e.volumeInfo!.imageLinks!.thumbnail!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                // reverse: true,
                viewportFraction: 0.44,
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.ease,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
              ),
            ),
          );
        } else if (state is FeaturesBooksFailure) {
          return CustomError(errorMessage: state.errorMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              period: const Duration(seconds: 2),
              child: ListView.builder(
                itemCount: 5,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomBookItemShimmer(),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
