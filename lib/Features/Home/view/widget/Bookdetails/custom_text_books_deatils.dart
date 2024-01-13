import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomTextBooksDeatils extends StatelessWidget {
  const CustomTextBooksDeatils({
    super.key,
    required this.listModel,
    required this.index,
  });
  final List<BookModel> listModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: Column(
          children: [
            Text(
              "${listModel[index].items[index].volumeInfo.title}",
              style:
                  ThemeStyle.textStyle30.copyWith(fontFamily: "GT Sectra Fine"),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "${listModel[index].items[index].volumeInfo.authors}",
              style: ThemeStyle.textStyle14,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${listModel[index].items[index].volumeInfo.pageCount} Page",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeStyle.textStyle16,
                ),
              ],
            )
          ],
        ));
  }
}
