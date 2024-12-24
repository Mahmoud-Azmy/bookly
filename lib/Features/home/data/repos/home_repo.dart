import 'package:dartz/dartz.dart';
import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
