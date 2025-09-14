import 'package:assestment_restaurant_app/core/data/model/favorite/favorite.dart';

sealed class FavoritesState {}

class FavoritesStateNone extends FavoritesState {}

class FavoritesStateLoading extends FavoritesState {}

class FavoritesStateError extends FavoritesState {
  String error;

  FavoritesStateError(this.error);
}

class FavoritesStateLoaded extends FavoritesState {
  List<Favorite> data;

  FavoritesStateLoaded(this.data);
}
