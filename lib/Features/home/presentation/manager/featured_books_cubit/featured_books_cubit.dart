import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/Features/home/data/repos/home_repo.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> featchFeaturedBooks() async {
    emit(
      FeaturedBooksLoading(),
    );
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailure(errMessage: failure.errorMessage),
        );
      },
      (books) {
        emit(
          FeaturedBooksSuccess(books: books),
        );
      },
    );
  }
}
