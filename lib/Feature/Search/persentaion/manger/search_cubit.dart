import 'package:bloc/bloc.dart';
import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:bookly/Feature/Search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks(String query) async {
    emit(SearchLoading());
    var results = await searchRepo.fetchSearchBooks(query);
    results.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
