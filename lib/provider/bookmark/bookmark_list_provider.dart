import 'package:assestment_restaurant_app/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:flutter/material.dart';

class BookmarkListProvider extends ChangeNotifier {
  final List<RestaurantDetail> _bookmarkRestaurantList = [];

  /// Add restaurant to bookmark list
  void addBookmarkList(RestaurantDetail value) {
    _bookmarkRestaurantList.add(value);
    notifyListeners();
  }

  /// Remove restaurant on bookmark list
  void removeBookmarkList(RestaurantDetail value) {
    _bookmarkRestaurantList.removeWhere((list) => list.id == value.id);
    notifyListeners();
  }

  /// Check if bookmark is not empty : return type bool
  bool checkBookmarkList(RestaurantDetail value) {
    final restaurantInBookmark = _bookmarkRestaurantList.where(
      (list) => list.id == value.id,
    );

    return restaurantInBookmark.isNotEmpty;
  }
}
