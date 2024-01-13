import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/Data/Repo/home_repo.dart';
import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeRepo {
  final ApiService apiService;
  HomeRepoImple(this.apiService);
  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      List<BookModel> listBook = [];
      Map<String, dynamic> data =
          await apiService.get("volumes?q=world&Filtering=free-ebooks");

      for (var i = 0; i < data["items"].length; i++) {
        listBook.add(BookModel.fromJson(data));
      }
      return right(listBook);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.erorrDioReqwist(e));
      }

      return left(ServerFailure(erorrMessage: "Oops Please Try Agin"));
    }
  }

  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchNewstBooks() async {
    try {
      List<BookModel> listBook = [];
      var data = await apiService
          .get("volumes?q=sport&Sorting= newest&Filtering=free-ebooks");
      for (var i = 0; i < data["items"].length; i++) {
        listBook.add(BookModel.fromJson(data));
      }
      return right(listBook);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.erorrDioReqwist(e));
      }

      return left(ServerFailure(erorrMessage: "Oops Please Try Agin"));
    }
  }

  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchSemllerBooks(
      catigory) async {
    try {
      List<BookModel> listBook = [];
      var data = await apiService
          .get("volumes?q=$catigory&Sorting=relevance&Filtering=free-ebooks");
      for (var i = 0; i < data["items"].length; i++) {
        listBook.add(BookModel.fromJson(data));
      }
      return right(listBook);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.erorrDioReqwist(e));
      }

      return left(ServerFailure(erorrMessage: "Oops Please Try Agin"));
    }
  }
}
