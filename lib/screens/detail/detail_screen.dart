import 'package:assestment_restaurant_app/core/provider/restaurant_detail/restaurant_detail_provider.dart';
import 'package:assestment_restaurant_app/screens/home/restaurant_card_shimmer.dart';
import 'package:assestment_restaurant_app/static/restaurant_detail_state.dart';
import 'package:assestment_restaurant_app/util/detail/body_of_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;

  const DetailScreen({super.key, required this.restaurantId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    Future.microtask(() {
      if (!mounted) return;
      context.read<RestaurantDetailProvider>().fetchRestaurantDetail(
        widget.restaurantId,
      );

      // RestaurantDetailProvider.fetchRestaurantDetail(widget.restaurantId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          /// Body of Detail Screen
          Consumer<RestaurantDetailProvider>(
            builder: (context, value, child) =>
                switch (value.result[widget.restaurantId]) {
                  /// Loading state value
                  RestaurantDetailStateLoading() =>
                    const RestaurantCardShimmer(),

                  /// Loaded state value
                  RestaurantDetailStateLoaded(data: var data) => Center(
                    child: BodyOfDetail(restaurantDetail: data),
                  ),

                  /// Error state value
                  RestaurantDetailStateError(data: var message) => Center(
                    child: Text(message),
                  ),

                  _ => const Center(child: Text('ini default state')),
                },
          ),
    );
  }
}
