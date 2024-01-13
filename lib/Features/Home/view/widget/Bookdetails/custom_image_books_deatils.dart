import 'package:booklyapp/Features/Home/Data/Models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class ImageBooksDeatils extends StatelessWidget {
  const ImageBooksDeatils({
    super.key,
    required this.listModel,
    required this.index,
  });
  final List<BookModel> listModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .28,
      child: AspectRatio(
        aspectRatio: 2.5 / 3.9,
        child: CachedNetworkImage(
            errorWidget: (context, url, error) => const Icon(Icons.error),
            progressIndicatorBuilder: (context, url, progress) =>
                const Center(child: CircularProgressIndicator()),
            fit: BoxFit.fill,
            imageUrl: listModel[index]
                    .items[index]
                    .volumeInfo
                    .imageLinks
                    ?.smallThumbnail ??
                ""),
      ),
    );
  }
}
