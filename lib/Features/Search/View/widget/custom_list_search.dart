import 'package:booklyapp/Features/Search/View/widget/custom_items_list_search.dart';
import 'package:booklyapp/Features/Search/View_model/cubit/search_state.dart';
import 'package:booklyapp/core/utils/function/check_privew_image.dart';
import 'package:flutter/material.dart';

class CustomListSearch extends StatelessWidget {
  const CustomListSearch({
    super.key,
    required this.state,
  });

  final SearchStateSucsses state;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (checkPrivewAndImageSearchBook(state: state, index: index)) {
            return CustomItemsListSearch(
              bookModel: state.listBookModel,
              index: index,
              state: state,
            );
          }
          return null;
        },
        itemCount: state.listBookModel.length,
      ),
    );
  }
}
