import 'package:flutter/material.dart';
import 'package:side_sticky_header/business_logic/feed/model/feed_model.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key, required this.feed})
      : super(key: key);
  final FeedModel feed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(5),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 10,
                  offset: const Offset(0, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Image.network(feed.image!,
                      height: 250, width: double.infinity, fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      height: 220,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    feed.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
