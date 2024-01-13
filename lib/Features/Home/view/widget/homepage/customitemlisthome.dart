import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class CustomItemListHome extends StatelessWidget {
  const CustomItemListHome({
    super.key,
    required this.bookModel,
    required this.index,
  });
  final List<BookModel> bookModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
            aspectRatio: 3 / 4,
            child: CachedNetworkImage(
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(child: CircularProgressIndicator()),
                fit: BoxFit.fill,
                imageUrl: bookModel[index]
                        .items[index]
                        .volumeInfo
                        .imageLinks
                        ?.thumbnail ??
                    "")),
      ),
    );
  }
}
