import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/Features/Home/view/widget/Bookdetails/custom_appbar_bookdetails.dart';
import 'package:booklyapp/Features/Home/view/widget/Bookdetails/custom_image_books_deatils.dart';
import 'package:booklyapp/Features/Home/view/widget/Bookdetails/custom_list_view_book_deatils.dart';
import 'package:booklyapp/Features/Home/view/widget/Bookdetails/custom_price_free_books_deatils.dart';
import 'package:booklyapp/Features/Home/view/widget/Bookdetails/custom_text_books_deatils.dart';
import 'package:booklyapp/Features/Home/view/widget/Bookdetails/custom_text_row_book_detalis.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final List<BookModel> bookModel;
  @override
  Widget build(BuildContext context) {
    Map map = GoRouterState.of(context).extra as Map;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: Column(
              children: [
                const CustomAppBarBookDetails(),
                const SizedBox(height: 33),
                ImageBooksDeatils(listModel: bookModel, index: map["index"]),
                const SizedBox(height: 43),
                CustomTextBooksDeatils(
                    listModel: bookModel, index: map["index"]),
                const SizedBox(height: 37),
                CustomPriceAndFreeBooksDeatils(
                    listModel: bookModel, index: map["index"]),
                const SizedBox(height: 39),
                const CustomRowTextBookDetalis(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: CustomListViewBookDeatils(
            listModel: bookModel,
          ),
        )
      ],
    );
  }
}
