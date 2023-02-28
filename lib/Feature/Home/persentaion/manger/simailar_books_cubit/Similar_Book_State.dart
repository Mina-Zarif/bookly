part of 'Similar_Book_Cubit.dart';

@immutable
abstract class SimilarBookState extends Equatable {
  const SimilarBookState();

  @override
  List<Object> get props => [];
}

class SimilarBookInitial extends SimilarBookState {}

class SimilarBookLoading extends SimilarBookState {}

class SimilarBookFailure extends SimilarBookState {
  final String errorMessage;

  const SimilarBookFailure(this.errorMessage);
}

class SimilarBookSuccess extends SimilarBookState {
  final List<BookModel> books;
  const SimilarBookSuccess(this.books);
}
