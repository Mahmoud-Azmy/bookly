import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/Features/home/data/repos/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());
  final HomeRepo homeRepo;

  Future<void> featchNewestBooks() async {
    emit(
      NewestBooksLoading(),
    );
    var result = await homeRepo.featchNewestBooks();
    result.fold(
      (failure) {
        emit(
          NewestBooksFailure(errMessage: failure.errorMessage),
        );
      },
      (books) {
        emit(
          NewestBooksSuccess(
            books: books,
          ),
        );
      },
    );
  }
}
