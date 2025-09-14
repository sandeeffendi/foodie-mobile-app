import 'package:flutter/material.dart';

class BookmarkIconProvider extends ChangeNotifier {
  bool _isBookmarked = false;

  bool get isBookmarked => _isBookmarked;

  set setIsBookmarked(bool value) {
    _isBookmarked = value;
    notifyListeners();
  }
}
