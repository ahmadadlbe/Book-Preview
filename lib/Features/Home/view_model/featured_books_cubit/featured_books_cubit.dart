import 'package:booklyapp/Features/Home/Data/Repo/home_repo.dart';
import 'package:booklyapp/Features/Home/view_model/featured_books_cubit/featured_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchbooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((l) {
      emit(FeaturedBooksFailure(l.erorrMessage));
    }, (book) {
      emit(FeaturedBooksSucsses(book));
    });
  }
}
