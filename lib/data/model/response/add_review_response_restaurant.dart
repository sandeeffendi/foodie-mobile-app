import 'package:assestment_restaurant_app/data/model/restaurant_detail/customer_review/customer_review.dart';

class AddReviewRestaurantResponse {
  final bool error;
  final String message;
  final List<CustomerReview> customerReviews;

  AddReviewRestaurantResponse({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  factory AddReviewRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      AddReviewRestaurantResponse(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReview>.from(
          json["customerReviews"].map((x) => CustomerReview.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "customerReviews": List<dynamic>.from(
      customerReviews.map((x) => x.toJson()),
    ),
  };
}
