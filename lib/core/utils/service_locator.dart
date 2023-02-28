import 'package:bookly/Feature/Home/data/repos/home_repo_impl.dart';
import 'package:bookly/Feature/Search/data/repos/search_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt.get<ApiServices>()));
}
