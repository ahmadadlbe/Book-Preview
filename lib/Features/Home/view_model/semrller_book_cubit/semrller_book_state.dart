import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';

sealed class SemrllerBookState {
  const SemrllerBookState();
}

class SemrllerBookInitial extends SemrllerBookState {}

class SemrllerBookLoading extends SemrllerBookState {}

class SemrllerBookSuccess extends SemrllerBookState {
  final List<BookModel> bookModel;

  SemrllerBookSuccess(this.bookModel);
}

class SemrllerBookFailure extends SemrllerBookState {
  final String errorMesage;

  SemrllerBookFailure(this.errorMesage);
}
