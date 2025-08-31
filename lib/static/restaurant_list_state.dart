import 'package:assestment_restaurant_app/data/model/restaurant/restaurant.dart';

sealed class RestaurantListState {}

class RestaurantListStateNone extends RestaurantListState {}

class RestaurantListStateLoading extends RestaurantListState {}

class RestaurantListStateLoaded extends RestaurantListState {
  List<Restaurant> data;

  RestaurantListStateLoaded(this.data);
}

class RestaurantListStateError extends RestaurantListState {
  String error;

  RestaurantListStateError(this.error);
}
