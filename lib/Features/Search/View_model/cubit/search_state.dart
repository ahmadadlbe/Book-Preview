import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchStateLoading extends SearchState {}

final class SearchStateSucsses extends SearchState {
  final List<BookModel> listBookModel;

  SearchStateSucsses({required this.listBookModel});
}

final class SearchStateFailure extends SearchState {
  final String errorMesage;

  SearchStateFailure({required this.errorMesage});
}
