import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepoSearch {
  Future<Either<ServerFailure, List<BookModel>>> fetchSearchBook(String search);
}
