import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:booklyapp/core/utils/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomItemsHomeNewstBooks extends StatelessWidget {
  const CustomItemsHomeNewstBooks({
    super.key,
    required this.bookModel,
    required this.index,
  });
  final List<BookModel> bookModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: AspectRatio(
                aspectRatio: 2.9 / 4,
                child: CachedNetworkImage(
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    progressIndicatorBuilder: (context, url, progress) =>
                        const Center(child: CircularProgressIndicator()),
                    fit: BoxFit.fill,
                    imageUrl: bookModel[index]
                            .items[index]
                            .volumeInfo
                            .imageLinks
                            ?.thumbnail ??
                        ""),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${bookModel[index].items[index].volumeInfo.title}",
                      style: ThemeStyle.textStyle20
                          .copyWith(fontFamily: "GT Sectra Fine"),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "${bookModel[index].items[index].volumeInfo.authors}",
                      style: ThemeStyle.textStyle14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Free",
                          style: ThemeStyle.textStyle18,
                        ),
                        const Spacer(),
                        Text(
                          "${bookModel[index].items[index].volumeInfo.pageCount ?? "1"} Page",
                          style: ThemeStyle.textStyle18,
                          textAlign: TextAlign.center,
                        )
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
