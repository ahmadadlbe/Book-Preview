import 'package:booklyapp/Features/Home/view/widget/homepage/custom_item_bestseller.dart';
import 'package:booklyapp/Features/Home/view_model/featured_newst_books_cubit/featured_newst_books_state.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/function/check_privew_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomListNewsBooks extends StatelessWidget {
  const CustomListNewsBooks({
    super.key,
    required this.state,
  });
  final NewstBooksSucsses state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: state.book.length,
        itemBuilder: (context, index) {
          if (checkPrivewAndImageNewstBook(state: state, index: index)) {
            return GestureDetector(
                onTap: () => GoRouter.of(context).push(AppRouter.deatilsView,
                    extra: {"ListModel": state.book, "index": index}),
                child: CustomItemsHomeNewstBooks(
                  bookModel: state.book,
                  index: index,
                ));
          }
          return const SizedBox();
        });
  }
}
