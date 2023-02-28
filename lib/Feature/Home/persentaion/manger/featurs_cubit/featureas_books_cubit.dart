import 'package:bloc/bloc.dart';
import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:bookly/Feature/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'featureas_books_state.dart';

class FeaturesBooksCubit extends Cubit<FeaturesBooksState> {
  FeaturesBooksCubit({required this.homeRepo}) : super(FeaturesBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturesBooksLoading());
    var result = await homeRepo.fetchFeatureBooks();
    result.fold((failure) {
      emit(FeaturesBooksFailure(failure.errorMessage));
    }, (books) {
      emit(FeaturesBooksSuccess(books));
    });
  }


}
