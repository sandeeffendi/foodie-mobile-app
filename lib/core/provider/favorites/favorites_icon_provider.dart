import 'package:flutter/material.dart';

class FavoritesIconProvider extends ChangeNotifier {
  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;

  void setFavorite(bool value) {
    _isFavorite = value;
    notifyListeners();
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }
}
