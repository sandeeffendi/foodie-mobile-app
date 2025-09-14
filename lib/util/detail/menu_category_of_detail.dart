import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:flutter/material.dart';

class MenuCategoryOfDetail extends StatefulWidget {
  final RestaurantDetail restaurantDetailMenus;

  const MenuCategoryOfDetail({super.key, required this.restaurantDetailMenus});

  @override
  State<MenuCategoryOfDetail> createState() => _MenuCategoryOfDetailState();
}

class _MenuCategoryOfDetailState extends State<MenuCategoryOfDetail> {
  @override
  Widget build(BuildContext context) {
    // List<Category> currentList;

    final foodMenus = widget.restaurantDetailMenus.menus.foods;
    final drinksMenus = widget.restaurantDetailMenus.menus.drinks;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Foods
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            'Foods',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        Divider(color: Color.fromARGB(128, 0, 0, 0)),

        /// Food Menus
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: foodMenus.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                foodMenus[index].name,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),

        /// Drinks
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Drinks',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),

        Divider(color: Color.fromARGB(128, 0, 0, 0)),

        /// Drinks Menus
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),

          itemCount: drinksMenus.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                drinksMenus[index].name,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ],
    );
  }
}
