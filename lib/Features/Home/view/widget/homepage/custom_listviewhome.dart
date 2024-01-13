import 'package:booklyapp/Features/Home/view/widget/homepage/custom_list_book_home.dart';
import 'package:booklyapp/Features/Home/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/Home/view_model/featured_books_cubit/featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListViewHome extends StatelessWidget {
  const CustomListViewHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSucsses) {
        return CustomListBookHome(
          state: state,
        );
      } else if (state is FeaturedBooksFailure) {
        return Text(state.errorMeassge);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
