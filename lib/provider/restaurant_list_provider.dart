import 'package:assestment_restaurant_app/data/api/api_services.dart';
import 'package:assestment_restaurant_app/data/model/response/restaurant_detail_response.dart';
import 'package:assestment_restaurant_app/static/restaurant_list_state.dart';
import 'package:flutter/material.dart';

class RestaurantListProvider extends ChangeNotifier {
  final ApiServices _apiServices;

  RestaurantListProvider(this._apiServices);

  RestaurantListState _listState = RestaurantListStateNone();

  RestaurantListState get listState => _listState;

  /// Cache Restaurant Detail Response
  final Map<String, RestaurantDetailResponse> _detailCache = {};
  Map<String, RestaurantDetailResponse> get detailCache => _detailCache;

  /// Getter detail Restaurant by Id from cache
  RestaurantDetailResponse? getDetailById(String id) => _detailCache[id];

  /// Fetch Method Restaurant List from API
  Future<void> fetchRestaurantList() async {
    _listState = RestaurantListStateLoading();

    final result = await _apiServices.getRestaurantlist();

    /// Error handling on result value
    try {
      if (result.error) {
        _listState = RestaurantListStateError(result.message);
      } else {
        _listState = RestaurantListStateLoaded(result.restaurants);

        /// Prefetch each Restaurant Detail
        for (final result in result.restaurants) {
          _apiServices.getRestaurantDetail(result.id).then((detailResponse) {
            if (!detailResponse.error) {
              _detailCache[result.id] = detailResponse;
              notifyListeners();
            }
          });
        }
      }
    }
    /// Catch Block on Exception state error
    on Exception catch (e) {
      _listState = RestaurantListStateError(e.toString());
    }
    /// Call notifylistener on all state
    finally {
      notifyListeners();
    }
  }
}
