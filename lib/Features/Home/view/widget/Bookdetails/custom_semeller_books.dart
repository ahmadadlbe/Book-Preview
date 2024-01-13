import 'package:booklyapp/Features/Home/view_model/semrller_book_cubit/semrller_book_state.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/function/check_privew_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSemellerBooksList extends StatelessWidget {
  const CustomSemellerBooksList({
    super.key,
    required this.state,
  });
  final SemrllerBookSuccess state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.bookModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (checkPrivewAndImageSmellerBook(state: state, index: index)) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AspectRatio(
                  aspectRatio: 2.5 / 3.9,
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context).push(
                        AppRouter.deatilsView,
                        extra: {"ListModel": state.bookModel, "index": index}),
                    child: CachedNetworkImage(
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        progressIndicatorBuilder: (context, url, progress) =>
                            const Center(child: CircularProgressIndicator()),
                        fit: BoxFit.fill,
                        imageUrl: state.bookModel[index].items[index].volumeInfo
                                .imageLinks?.smallThumbnail ??
                            "error"),
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        });
  }
}
