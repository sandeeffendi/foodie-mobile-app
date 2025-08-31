import 'package:assestment_restaurant_app/util/shimmer/shimmer_widget.dart';
import 'package:flutter/material.dart';

class RestaurantCardShimmer extends StatelessWidget {
  const RestaurantCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 130, maxWidth: double.infinity),
        child: Row(
          children: [
            ShimmerWidget(
              maxHeight: 120,
              maxWidth: 120,
              minHeight: 90,
              minWidth: 90,
            ),
            SizedBox.square(dimension: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShimmerWidget(
                    maxHeight: 15,
                    maxWidth: 200,
                    minHeight: 5,
                    minWidth: 150,
                  ),
                  ShimmerWidget(
                    maxHeight: 15,
                    maxWidth: 200,
                    minHeight: 5,
                    minWidth: 150,
                  ),
                  ShimmerWidget(
                    maxHeight: 15,
                    maxWidth: 200,
                    minHeight: 5,
                    minWidth: 150,
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
