import 'package:booklyapp/Features/Home/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/Home/view_model/featured_newst_books_cubit/featured_newst_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> refreshHomeView(context) async {
  BlocProvider.of<NewstBooksCubit>(context).fetchNewstBooks();
  BlocProvider.of<FeaturedBooksCubit>(context).fetchbooks();
}
