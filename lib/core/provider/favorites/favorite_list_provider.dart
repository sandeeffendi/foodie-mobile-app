import 'package:assestment_restaurant_app/core/data/model/favorite/favorite.dart';
import 'package:assestment_restaurant_app/static/favorites_state.dart';
import 'package:flutter/foundation.dart';
import 'package:assestment_restaurant_app/core/data/db/favorites_db.dart';

/// Provider modern untuk Favorites
final class FavoriteListProvider extends ChangeNotifier {
  final FavoritesDb _db;

  FavoriteListProvider({FavoritesDb? db}) : _db = db ?? FavoritesDb();

  // --- STATE ---
  FavoritesState _state = FavoritesStateNone();
  FavoritesState get state => _state;

  void _setState(FavoritesState newState) {
    _state = newState;
    notifyListeners();
  }

  /// Load Favorites from Database
  Future<void> loadFavorites() async {
    _setState(FavoritesStateLoading());

    try {
      final favorites = await _db.getAll();
      _setState(FavoritesStateLoaded(favorites));
    } catch (e) {
      _setState(FavoritesStateError(e.toString()));
      throw Exception('loadFavorites error: $e');
    }
  }

  /// DB Actions
  Future<void> addFavorite(Favorite favorite) async {
    await _db.upsert(favorite);
    await loadFavorites();
  }

  Future<void> removeFavorite(String id) async {
    await _db.delete(id);
    await loadFavorites();
  }

  Future<bool> isFavorite(String id) => _db.exists(id);
}
