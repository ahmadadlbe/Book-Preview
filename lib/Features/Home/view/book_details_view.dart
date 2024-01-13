import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/view/widget/Bookdetails/book_details_view_body.dart';
import 'package:booklyapp/Features/Home/view_model/semrller_book_cubit/semrller_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final List<BookModel> bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SemrllerBookCubit>(context).fetchSemellerBooks(
        "${(widget.bookModel[0].items[0].volumeInfo.categories) == null ? "d" : widget.bookModel[0].items[0].volumeInfo.categories}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsBody(bookModel: widget.bookModel),
    );
  }
}
