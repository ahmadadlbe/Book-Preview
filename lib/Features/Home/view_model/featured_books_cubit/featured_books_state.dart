import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';

abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksSucsses extends FeaturedBooksState {
  final List<BookModel> book;
  FeaturedBooksSucsses(this.book);
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMeassge;
  FeaturedBooksFailure(this.errorMeassge);
}
