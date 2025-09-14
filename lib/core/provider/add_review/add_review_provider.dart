import 'package:assestment_restaurant_app/core/data/api/api_services.dart';
import 'package:assestment_restaurant_app/static/review_state.dart';
import 'package:flutter/material.dart';

class AddReviewProvider extends ChangeNotifier {
  final ApiServices _apiServices;
  bool isLoading = false;
  bool isSuccess = false;

  AddReviewProvider(this._apiServices);

  ReviewState customerReview = ReviewStateNone();

  Future<void> addReview(String id, String name, String review) async {
    customerReview = ReviewStateLoading();
    isLoading = true;
    notifyListeners();

    try {
      final result = await _apiServices.addReviewRestaurant(id, name, review);

      if (result.error) {
        customerReview = ReviewStateError(result.error.toString());
      } else {
        customerReview = ReviewStateLoaded(result.customerReviews);
        isSuccess = true;
      }
    } on Exception catch (e) {
      customerReview = ReviewStateError(e.toString());
    } finally {
      notifyListeners();
      isLoading = false;
    }
  }

  void resetState() {
    isSuccess = false;
    customerReview = ReviewStateNone();
    notifyListeners();
  }
}
