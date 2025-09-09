import 'dart:convert';
import 'package:assestment_restaurant_app/data/model/response/add_review_response_restaurant.dart';
import 'package:assestment_restaurant_app/data/model/response/restaurant_detail_response.dart';
import 'package:http/http.dart' as http;
import 'package:assestment_restaurant_app/data/model/response/restaurant_list_response.dart';

class ApiServices {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  /// Get Restaurant List Response Method
  Future<RestaurantListResponse> getRestaurantlist() async {
    final response = await http.get(Uri.parse('$_baseUrl/list'));

    /// Check error first
    if (response.statusCode == 404) {
      throw Exception(
        'Code:${response.statusCode} Not Found. Failed to fetch Restaurant list. ',
      );
    } else if (response.statusCode == 403) {
      throw Exception(
        'Code:${response.statusCode} Unauthorized. Failed to fetch data',
      );
    } else if (response.statusCode == 400) {
      throw Exception('Code:${response.statusCode}. No internet access');
    }

    /// If there is no error return restaurant list response
    return RestaurantListResponse.fromJson(jsonDecode(response.body));
  }

  /// Get Restaurant Detail Response method
  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/detail/$id'));

    /// Check error first
    if (response.statusCode == 404) {
      throw Exception(
        'Code:${response.statusCode} Not Found. Failed to fetch Restaurant Detail. ',
      );
    } else if (response.statusCode == 403) {
      throw Exception(
        'Code:${response.statusCode} Unauthorized. Failed to fetch data',
      );
    } else if (response.statusCode == 404) {
      throw Exception('Code:${response.statusCode}. No internet access');
    }

    /// If there is no error return Restaurant Detail Response
    return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
  }

  /// Post Add Review Restaurant Method
  Future<AddReviewRestaurantResponse> addReviewRestaurant(
    String id,
    String name,
    String review,
  ) async {
    /// Body request model
    Map<String, dynamic> body = {'id': id, 'name': name, 'review': review};

    final response = await http.post(
      Uri.parse('$_baseUrl/review'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    /// Check Error First
    if (response.statusCode == 404) {
      throw Exception(
        'Code:${response.statusCode} Not Found. Failed to add Restauarant review. ',
      );
    } else if (response.statusCode == 403) {
      throw Exception(
        'Code:${response.statusCode} Unauthorized. Failed to fetch data',
      );
    } else if (response.statusCode == 400) {
      throw Exception('Code:${response.statusCode}. No internet access');
    }

    /// If there is no error return review response
    return AddReviewRestaurantResponse.fromJson(jsonDecode(response.body));
  }

  /// Get Restaurant by Name, Category, & Menu Method
}
