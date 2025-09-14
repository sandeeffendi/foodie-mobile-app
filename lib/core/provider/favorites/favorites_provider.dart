import 'package:assestment_restaurant_app/core/data/db/favorites_db.dart';
import 'package:assestment_restaurant_app/core/data/model/favorite/favorite.dart';
import 'package:assestment_restaurant_app/static/favorites_state.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesDb _db = FavoritesDb();

  FavoritesState _favorites = FavoritesStateNone();
  FavoritesState get favorites => _favorites;

  /// Load all favorites method
  Future<void> loadFavorites() async {
    _favorites = FavoritesStateLoading();
    notifyListeners();

    try {
      var result = await _db.getAll();
      if (result.isEmpty) {
        _favorites = FavoritesStateNone();
      } else {
        _favorites = FavoritesStateLoaded(result);
      }
    } on Exception catch (e) {
      _favorites = FavoritesStateError(e.toString());
    } finally {
      notifyListeners();
    }
  }

  /// Add favorites method
  Future<void> addFavorites(Favorite restaurant) async {
    await _db.upsert(restaurant);
    if (_favorites is FavoritesStateLoaded) {
      final current = (_favorites as FavoritesStateLoaded).data;

      _favorites = FavoritesStateLoaded([...current, restaurant]);
      notifyListeners();
    } else {
      await loadFavorites();
    }
  }

  /// Delete favorites method
  Future<void> deleteFavorites(String id) async {
    await _db.delete(id);
    if (_favorites is FavoritesStateLoaded) {
      final current = (_favorites as FavoritesStateLoaded).data;
      final updated = current.where((fav) => fav.id != id).toList();

      _favorites = FavoritesStateLoaded(updated);
      notifyListeners();
    } else {
      await loadFavorites();
    }
  }

  /// Check if favorites with id is exists
  Future<bool> isFavorite(String id) async {
    return _db.exists(id);
  }
}
