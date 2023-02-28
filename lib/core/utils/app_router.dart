import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:bookly/Feature/Home/data/repos/home_repo_impl.dart';
import 'package:bookly/Feature/Home/persentaion/details_view/DetailsView.dart';
import 'package:bookly/Feature/Home/persentaion/home_view/HomeView.dart';
import 'package:bookly/Feature/Home/persentaion/manger/simailar_books_cubit/Similar_Book_Cubit.dart';
import 'package:bookly/Feature/Search/persentaion/search_view.dart';
import 'package:bookly/Feature/Splash/Splach_view.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const homeView = '/homeView';
  static const detailsView = '/detailsView';
  static const searchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: detailsView,
        builder: (context, state) =>
            BlocProvider(
              create: (context) => SimilarBookCubit(homeRepo: getIt.get<HomeRepoImpl>(),)..fetchSimilarBook(""),
              child: DetailsView(bookModel: state.extra as BookModel),
            ),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
