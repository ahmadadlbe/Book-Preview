import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Search/Data/Repo/home_repo.dart';
import 'package:booklyapp/core/errors/failure.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ImpHomeRepoSearch extends HomeRepoSearch {
  final ApiService apiService;

  ImpHomeRepoSearch(this.apiService);
  @override
  Future<Either<ServerFailure, List<BookModel>>> fetchSearchBook(
      String search) async {
    try {
      List<BookModel> listModel = [];
      var data =
          await apiService.get("volumes?q=$search&Filtering=free-ebooks");
      for (var i = 0; i < data["items"].length; i++) {
        listModel.add(BookModel.fromJson(data));
      }
      return right(listModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.erorrDioReqwist(e));
      } else {
        return left(ServerFailure(erorrMessage: "Oops"));
      }
    }
  }
}
