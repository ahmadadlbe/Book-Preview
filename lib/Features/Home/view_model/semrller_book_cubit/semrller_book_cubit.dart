import 'package:booklyapp/Features/Home/Data/Repo/home_repo.dart';
import 'package:booklyapp/Features/Home/view_model/semrller_book_cubit/semrller_book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SemrllerBookCubit extends Cubit<SemrllerBookState> {
  SemrllerBookCubit(this.homeRepo) : super(SemrllerBookInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSemellerBooks(String catigory) async {
    emit(SemrllerBookLoading());
    var result = await homeRepo.fetchSemllerBooks(catigory);
    result.fold((failure) {
      emit(SemrllerBookFailure(failure.erorrMessage));
    }, (book) {
      emit(SemrllerBookSuccess(book));
    });
  }
}
