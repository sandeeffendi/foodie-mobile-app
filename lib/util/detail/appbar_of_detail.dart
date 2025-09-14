import 'dart:ui';

import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:assestment_restaurant_app/routes/navigation_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppbarOfDetail extends StatelessWidget {
  final RestaurantDetail restaurantDetail;

  const AppbarOfDetail({super.key, required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      expandedHeight: 275,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.white,

      /// Image restaurant picture Id
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://restaurant-api.dicoding.dev/images/large/${restaurantDetail.pictureId}',
          fit: BoxFit.cover,
        ),

        /// Image Strech mode
        stretchModes: [StretchMode.blurBackground, StretchMode.zoomBackground],
      ),

      // Bottom Container
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),

        child: Container(
          alignment: Alignment.center,

          height: 32,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
        ),
      ),
      leadingWidth: 80,
      leading: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, NavigationRoute.main.name);
        },

        child: Container(
          margin: const EdgeInsets.only(left: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(56),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                height: 56,
                width: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(190, 100, 100, 100),
                ),

                child: Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
