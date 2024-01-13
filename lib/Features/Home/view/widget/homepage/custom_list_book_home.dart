import 'package:booklyapp/Features/Home/view/widget/homepage/customitemlisthome.dart';
import 'package:booklyapp/Features/Home/view_model/featured_books_cubit/featured_books_state.dart';
import 'package:booklyapp/core/utils/function/check_privew_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomListBookHome extends StatelessWidget {
  const CustomListBookHome({
    super.key,
    required this.state,
  });
  final FeaturedBooksSucsses state;
  @override
  Widget build(BuildContext context) {
    for (var v = 0; v <= state.book.length;) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .27,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (checkPrivewAndImageFeaturdBook(state: state, index: index)) {
                return GestureDetector(
                  onTap: () => GoRouter.of(context).push(AppRouter.deatilsView,
                      extra: {"ListModel": state.book, "index": index}),
                  child: CustomItemListHome(
                    bookModel: state.book,
                    index: index,
                  ),
                );
              }
              return const SizedBox();
            },
            itemCount: state.book.length),
      );
    }
    return const SizedBox();
  }
}
