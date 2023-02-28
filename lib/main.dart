import 'package:bookly/Feature/Home/data/repos/home_repo_impl.dart';
import 'package:bookly/Feature/Home/persentaion/manger/featurs_cubit/featureas_books_cubit.dart';
import 'package:bookly/Feature/Home/persentaion/manger/newest_books/newest_books_cubit.dart';
import 'package:bookly/Feature/Search/data/repos/search_repo_impl.dart';
import 'package:bookly/Feature/Search/persentaion/manger/search_cubit.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'core/utils/service_locator.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturesBooksCubit(homeRepo: getIt.get<HomeRepoImpl>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(homeRepo: getIt.get<HomeRepoImpl>())
                ..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) =>
              SearchCubit(searchRepo: getIt.get<SearchRepoImpl>()),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          appBarTheme: const AppBarTheme(),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
