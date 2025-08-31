import 'package:assestment_restaurant_app/data/model/restaurant/restaurant.dart';
import 'package:assestment_restaurant_app/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final Function() onTap;
  final RestaurantDetail restaurantDetail;

  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
    required this.restaurantDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Restaurant Image Thumbnail
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 90),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),

                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/small/${restaurant.pictureId}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox.square(dimension: 10),

            /// Restaurant Information
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Restaurant Name
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox.square(dimension: 6),

                  /// City & Ratings
                  Row(
                    children: [
                      /// City
                      Center(
                        child: Row(
                          children: [
                            Icon(Icons.pin_drop_outlined),
                            SizedBox.square(dimension: 4),
                            Text(restaurant.city),
                          ],
                        ),
                      ),

                      SizedBox.square(dimension: 8),

                      /// Ratings and Review count
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.star_border_outlined),
                            SizedBox.square(dimension: 4),
                            Text(restaurant.rating.toString()),
                            SizedBox.square(dimension: 8),
                            Text(
                              '(${restaurantDetail.customerReviews.length.toString()} reviews)',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox.square(dimension: 6),

                  /// Open & Address
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Open Container
                      Container(
                        height: 27,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        child: Center(
                          child: Text(
                            'open',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                          ),
                        ),
                      ),

                      SizedBox.square(dimension: 8),

                      /// Address
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.my_location_outlined),
                            SizedBox.square(dimension: 8),
                            Expanded(
                              child: Text(
                                restaurantDetail.address,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
