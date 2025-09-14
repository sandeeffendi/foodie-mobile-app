import 'package:assestment_restaurant_app/core/data/api/api_services.dart';
import 'package:assestment_restaurant_app/static/restaurant_detail_state.dart';
import 'package:flutter/material.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiServices _apiServices;
  RestaurantDetailProvider(this._apiServices);

  final Map<String, RestaurantDetailState> _result = {};

  Map<String, RestaurantDetailState> get result => _result;

  // RestaurantDetailState? getDetailById(String id) => _result[id];

  Future<void> fetchRestaurantDetail(String id) async {
    /// Return Loading state value
    _result[id] = RestaurantDetailStateLoading();
    notifyListeners();

    /// Error handling on detail state value
    try {
      final result = await _apiServices.getRestaurantDetail(id);

      if (result.error) {
        _result[id] = RestaurantDetailStateError(result.message);
      } else {
        _result[id] = RestaurantDetailStateLoaded(result.restaurant);
      }
    }
    /// Catch Block on Exception error state
    on Exception catch (e) {
      _result[id] = RestaurantDetailStateError(e.toString());
    }
    /// Return notifyListeners on all state
    finally {
      notifyListeners();
    }
  }
}
