import 'package:booklyapp/Features/Home/view_model/featured_books_cubit/featured_books_state.dart';
import 'package:booklyapp/Features/Home/view_model/featured_newst_books_cubit/featured_newst_books_state.dart';
import 'package:booklyapp/Features/Home/view_model/semrller_book_cubit/semrller_book_state.dart';
import 'package:booklyapp/Features/Search/View_model/cubit/search_state.dart';

bool checkPrivewAndImageNewstBook(
    {required NewstBooksSucsses state, required int index}) {
  return state.book[index].items[index].volumeInfo.previewLink != null &&
      state.book[index].items[index].volumeInfo.imageLinks?.thumbnail != null;
}

bool checkPrivewAndImageFeaturdBook(
    {required FeaturedBooksSucsses state, required int index}) {
  return state.book[index].items[index].volumeInfo.previewLink != null &&
      state.book[index].items[index].volumeInfo.imageLinks?.thumbnail != null;
}

bool checkPrivewAndImageSmellerBook(
    {required SemrllerBookSuccess state, required int index}) {
  return state.bookModel[index].items[index].volumeInfo.imageLinks?.thumbnail !=
          null &&
      state.bookModel[index].items[index].volumeInfo.previewLink != null;
}

bool checkPrivewAndImageSearchBook(
    {required SearchStateSucsses state, required int index}) {
  return state.listBookModel[index].items[index].volumeInfo.imageLinks
              ?.thumbnail !=
          null &&
      state.listBookModel[index].items[index].volumeInfo.previewLink != null;
}
