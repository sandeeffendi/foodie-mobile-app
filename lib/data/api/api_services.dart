import 'dart:convert';
import 'package:assestment_restaurant_app/data/model/response/restaurant_detail_response.dart';
import 'package:http/http.dart' as http;
import 'package:assestment_restaurant_app/data/model/response/restaurant_list_response.dart';

class ApiServices {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantListResponse> getRestaurantlist() async {
    final response = await http.get(Uri.parse('$_baseUrl/list'));

    // TODO: Refactor with full status code
    if (response.statusCode == 200 || response.statusCode == 201) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Caught an error. Failed to fetch Restaurant List');
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/detail/$id'));

    // TODO: Refactor with full status code
    if (response.statusCode == 200 || response.statusCode == 201) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Caught an error. Failed to fetch Restaurant Detail');
    }
  }
}
