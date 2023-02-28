import 'package:bookly/Feature/Home/data/models/BookModel.dart';
import 'package:bookly/Feature/Home/persentaion/widgets/book_rate_view.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({Key? key, required this.model}) : super(key: key);
  final BookModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.detailsView, extra: model);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: 2.7 / 4,
                child: CachedNetworkImage(
                  imageUrl: model.volumeInfo!.imageLinks!.smallThumbnail!,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: const [
                        Icon(
                          Icons.error,
                          size: 30,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Error in Server",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      model.volumeInfo!.title!,
                      maxLines: 2,
                      style: Styles.textStyle20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        model.volumeInfo!.publisher??"Unknown Writer",
                        style: Styles.textStyle14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                      const Spacer(),
                      BookRate(
                          publishDate:
                              model.volumeInfo!.publishedDate!.substring(0, 4),
                          avrageRate:
                              model.volumeInfo!.averageRating!.toString()),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
