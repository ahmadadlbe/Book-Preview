import 'package:booklyapp/Features/Search/Data/Repo/implemnt_home_repo.dart';
import 'package:booklyapp/Features/Search/View_model/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final ImpHomeRepoSearch homeRepoSearch;
  SearchCubit(this.homeRepoSearch) : super(SearchInitial());

  Future<void> fetchSearchBooks(String search) async {
    if (search == "") {
      emit(SearchInitial());
    }
    emit(SearchStateLoading());
    var ruselt = await homeRepoSearch.fetchSearchBook(search);
    ruselt.fold((failure) {
      emit(SearchStateFailure(errorMesage: failure.erorrMessage));
    }, (books) {
      emit(SearchStateSucsses(listBookModel: books));
    });
  }
}
