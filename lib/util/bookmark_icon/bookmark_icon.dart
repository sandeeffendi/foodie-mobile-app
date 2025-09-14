import 'package:assestment_restaurant_app/core/provider/bookmark/bookmark_icon_provider.dart';
import 'package:assestment_restaurant_app/core/provider/bookmark/bookmark_list_provider.dart';
import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BookmarkIcon extends StatefulWidget {
  final RestaurantDetail restaurantDetail;

  const BookmarkIcon({super.key, required this.restaurantDetail});

  @override
  State<BookmarkIcon> createState() => _BookmarkIconState();
}

class _BookmarkIconState extends State<BookmarkIcon> {
  @override
  void initState() {
    final bookmarkIcon = context.read<BookmarkIconProvider>();
    final bookmarkRestaurantList = context.read<BookmarkListProvider>();

    Future.microtask(() {
      final restaurantInList = bookmarkRestaurantList.checkBookmarkList(
        widget.restaurantDetail,
      );

      bookmarkIcon.setIsBookmarked = restaurantInList;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bookmarkIcon = context.read<BookmarkIconProvider>();
        final bookmarkRestaurantList = context.read<BookmarkListProvider>();
        final restaurantInList = bookmarkIcon.isBookmarked;

        if (!restaurantInList) {
          bookmarkRestaurantList.addBookmarkList(widget.restaurantDetail);
        } else {
          bookmarkRestaurantList.removeBookmarkList(widget.restaurantDetail);
        }

        bookmarkIcon.setIsBookmarked = !restaurantInList;
      },
      icon: Icon(
        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark
            : Icons.bookmark_outline,
      ),
    );
  }
}
