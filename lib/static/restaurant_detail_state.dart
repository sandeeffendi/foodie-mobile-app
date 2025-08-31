import 'package:assestment_restaurant_app/data/model/restaurant_detail/retaurant_detail.dart';

sealed class RestaurantDetailState {}

class RestaurantDetailStateNone extends RestaurantDetailState {}

class RestaurantDetailStateLoading extends RestaurantDetailState {}

class RestaurantDetailStateLoaded extends RestaurantDetailState {
  RestaurantDetail data;

  RestaurantDetailStateLoaded(this.data);
}

class RestaurantDetailStateError extends RestaurantDetailState {
  String data;
  RestaurantDetailStateError(this.data);
}
