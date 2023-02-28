import 'package:bloc/bloc.dart';
import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:bookly/Feature/Home/data/repos/home_repo.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'Similar_Book_State.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit({required this.homeRepo}) : super(SimilarBookInitial());
  HomeRepo homeRepo;

  Future<void> fetchSimilarBook(String category) async {
    emit(SimilarBookLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) => emit(SimilarBookFailure(failure.errorMessage)),
        (books) => emit(SimilarBookSuccess(books)));
  }
}
