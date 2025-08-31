import 'package:assestment_restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:assestment_restaurant_app/provider/restaurant_list_provider.dart';
import 'package:assestment_restaurant_app/routes/navigation_route.dart';
import 'package:assestment_restaurant_app/screens/home/restaurant_card.dart';
import 'package:assestment_restaurant_app/screens/home/restaurant_card_shimmer.dart';
import 'package:assestment_restaurant_app/static/restaurant_detail_state.dart';
import 'package:assestment_restaurant_app/static/restaurant_list_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final listProvider = context.read<RestaurantListProvider>();
      final detailProvider = context.read<RestaurantDetailProvider>();

      /// Fetch Restaurant list
      /// Then if Restaurant List State is loaded Fetch each Restaurant detail
      /// With data from restaurant list
      listProvider.fetchRestaurantList().then((_) {
        if (listProvider.listState is RestaurantListStateLoaded) {
          final restaurant =
              (listProvider.listState as RestaurantListStateLoaded).data;

          /// Fetch each Restaurant detail
          for (var result in restaurant) {
            detailProvider.fetchRestaurantDetail(result.id);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailProvider = context.watch<RestaurantDetailProvider>();

    return Scaffold(
      floatingActionButton: CircleAvatar(child: Icon(Icons.add)),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          ),
        ],
      ),
      body:
          /// Restaurant List Provider
          Consumer<RestaurantListProvider>(
            builder: (context, value, child) {
              return switch (value.listState) {
                /// Restaurant State Loading
                (RestaurantListStateLoading() || RestaurantListStateNone()) =>
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return RestaurantCardShimmer();
                    },
                  ),

                /// Loaded State Value From Restaurant List Provider
                RestaurantListStateLoaded(data: var restaurantList) =>
                  ListView.builder(
                    itemCount: restaurantList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final restaurant = restaurantList[index];
                      final restaurantDetail =
                          detailProvider.result[restaurant.id];

                      return switch (restaurantDetail) {
                        RestaurantDetailStateLoaded(data: var detail) =>
                          RestaurantCard(
                            restaurant: restaurant,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                NavigationRoute.detail.name,
                                arguments: restaurant.id,
                              );
                            },
                            restaurantDetail: detail,
                          ),

                        /// Restaurant State Error
                        RestaurantListStateError(error: var message) => Center(
                          child: Text(message),
                        ),

                        /// Default state value
                        _ => const SizedBox(),
                      };

                      /// Restaurant Detial Provider
                    },
                  ),

                /// Default Value
                _ => const SizedBox(),
              };
            },
          ),
    );
  }
}
