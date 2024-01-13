import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/view/widget/Bookdetails/custom_semeller_books.dart';
import 'package:booklyapp/Features/Home/view_model/semrller_book_cubit/semrller_book_cubit.dart';
import 'package:booklyapp/Features/Home/view_model/semrller_book_cubit/semrller_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewBookDeatils extends StatelessWidget {
  const CustomListViewBookDeatils({
    super.key,
    required this.listModel,
  });
  final List<BookModel> listModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: BlocBuilder<SemrllerBookCubit, SemrllerBookState>(
          builder: (context, state) {
            if (state is SemrllerBookSuccess) {
              for (var i = 0; i <= state.bookModel.length;) {
                return CustomSemellerBooksList(
                  state: state,
                );
              }
              return const SizedBox();
            } else if (state is SemrllerBookFailure) {
              return Text(state.errorMesage);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
