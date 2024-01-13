import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

sealed class NewstBooksState extends Equatable {
  const NewstBooksState();

  @override
  List<Object> get props => [];
}

final class NewstBooksInitial extends NewstBooksState {}

final class NewstBooksLoading extends NewstBooksState {}

final class NewstBooksSucsses extends NewstBooksState {
  final List<BookModel> book;
  const NewstBooksSucsses(this.book);
}

final class NewstBooksFailure extends NewstBooksState {
  final String errorMasseg;
  const NewstBooksFailure(this.errorMasseg);
}
