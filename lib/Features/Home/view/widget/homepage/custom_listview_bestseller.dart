import 'package:booklyapp/Features/Home/view/widget/homepage/custom_list_newst_books.dart';
import 'package:booklyapp/Features/Home/view_model/featured_newst_books_cubit/featured_newst_books_cubit.dart';
import 'package:booklyapp/Features/Home/view_model/featured_newst_books_cubit/featured_newst_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHomeNewstBooks extends StatelessWidget {
  const CustomHomeNewstBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewstBooksCubit, NewstBooksState>(
      builder: (context, state) {
        if (state is NewstBooksSucsses) {
          for (var i = 0; i <= state.book.length;) {
            return CustomListNewsBooks(
              state: state,
            );
          }
          return const SizedBox();
        } else if (state is NewstBooksFailure) {
          return Text(state.errorMasseg);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
