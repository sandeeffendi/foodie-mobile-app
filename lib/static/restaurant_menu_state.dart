
import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/menu/menu.dart';

sealed class RestaurantMenuState {}

class RestaurantMenuStateNone extends RestaurantMenuState {}

class RestaurantMenuStateLoading extends RestaurantMenuState {}

class RestaurantMenuStateError extends RestaurantMenuState {
  String error;

  RestaurantMenuStateError(this.error);
}

class RestaurantMenuStateLoaded extends RestaurantMenuState {
  List<Menus> data;

  RestaurantMenuStateLoaded(this.data);
}
