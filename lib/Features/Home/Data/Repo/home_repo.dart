import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<ServerFailure, List<BookModel>>> fetchNewstBooks();
  Future<Either<ServerFailure, List<BookModel>>> fetchSemllerBooks(
      String catigory);
}
