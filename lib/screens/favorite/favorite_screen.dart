import 'package:assestment_restaurant_app/core/provider/favorites/favorites_provider.dart';
import 'package:assestment_restaurant_app/routes/navigation_route.dart';
import 'package:assestment_restaurant_app/screens/favorite/favorite_card.dart';
import 'package:assestment_restaurant_app/screens/home/restaurant_card_shimmer.dart';
import 'package:assestment_restaurant_app/static/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();

    final favoriteProvider = context.read<FavoritesProvider>();
    Future.microtask(() {
      favoriteProvider.loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavoritesProvider>(
        builder: (context, value, child) => switch (value.favorites) {
          FavoritesStateLoading() => ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return RestaurantCardShimmer();
            },
          ),

          FavoritesStateLoaded(data: var favoriteList) => ListView.builder(
            itemCount: favoriteList.length,
            itemBuilder: (BuildContext context, int index) {
              final favoriteItem = favoriteList[index];

              return FavoriteCard(
                favorite: favoriteItem,
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    NavigationRoute.detail.name,
                    arguments: favoriteItem.id,
                  );
                },
              );
            },
          ),

          FavoritesStateNone() => const Center(
            child: Text('You don\'t have any favorite restaurant.'),
          ),

          _ => const SizedBox(),
        },
      ),
    );
  }
}
