import 'package:booklyapp/Features/Home/Data/Repo/home_repo.dart';
import 'package:booklyapp/Features/Home/view_model/featured_newst_books_cubit/featured_newst_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewstBooksCubit extends Cubit<NewstBooksState> {
  NewstBooksCubit(this.homeRepo) : super(NewstBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchNewstBooks() async {
    emit(NewstBooksLoading());
    var result = await homeRepo.fetchNewstBooks();
    result.fold((failure) {
      emit(NewstBooksFailure(failure.erorrMessage));
    }, (book) {
      emit(NewstBooksSucsses(book));
    });
  }
}
