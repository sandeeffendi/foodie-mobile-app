import 'package:assestment_restaurant_app/screens/home/restaurant_card_shimmer.dart';
import 'package:flutter/material.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Center(child: RestaurantCardShimmer()),
          SizedBox.square(dimension: 10),
        ],
      ),
    );
  }
}
