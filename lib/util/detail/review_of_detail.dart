import 'package:assestment_restaurant_app/data/model/restaurant_detail/customer_review/customer_review.dart';
import 'package:assestment_restaurant_app/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:assestment_restaurant_app/util/detail/review_card.dart';
import 'package:flutter/material.dart';

class ReviewOfDetail extends StatelessWidget {
  final RestaurantDetail restaurantDetail;

  const ReviewOfDetail({super.key, required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    final List<CustomerReview> customerReview =
        restaurantDetail.customerReviews;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        /// Customer Review
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            'Customer Review',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        Divider(color: Color.fromARGB(128, 0, 0, 0)),

        /// Customer review list view card
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: customerReview.length,
            itemBuilder: (BuildContext context, int index) {
              final customer = customerReview[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: ReviewCard(
                  customerName: customer.name,
                  customerReview: customer.review,
                  dateAdded: customer.date,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
