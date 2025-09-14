import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/customer_review/customer_review.dart';

sealed class ReviewState {}

class ReviewStateNone extends ReviewState {}

class ReviewStateLoading extends ReviewState {}

class ReviewStateLoaded extends ReviewState {
  List<CustomerReview> customerReview;

  ReviewStateLoaded(this.customerReview);
}

class ReviewStateError extends ReviewState {
  String message;

  ReviewStateError(this.message);
}
