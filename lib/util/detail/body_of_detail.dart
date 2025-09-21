import 'package:assestment_restaurant_app/core/data/model/favorite/favorite.dart';
import 'package:assestment_restaurant_app/core/provider/favorites/favorites_icon_provider.dart';
import 'package:assestment_restaurant_app/core/provider/favorites/favorites_provider.dart';
import 'package:assestment_restaurant_app/core/provider/restaurant_detail/detail_description_provider.dart';
import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:assestment_restaurant_app/util/detail/add_customer_review/add_review.dart';
import 'package:assestment_restaurant_app/util/detail/appbar_of_detail.dart';
import 'package:assestment_restaurant_app/util/detail/menu_category_of_detail.dart';
import 'package:assestment_restaurant_app/util/detail/review_of_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyOfDetail extends StatefulWidget {
  final RestaurantDetail restaurantDetail;

  const BodyOfDetail({super.key, required this.restaurantDetail});

  @override
  State<BodyOfDetail> createState() => _BodyOfDetailState();
}

class _BodyOfDetailState extends State<BodyOfDetail> {
  @override
  void initState() {
    super.initState();

    final favoriteProvider = context.read<FavoritesProvider>();
    final favoritesIconProvider = context.read<FavoritesIconProvider>();

    Future.microtask(() async {
      final result = await favoriteProvider.isFavorite(
        widget.restaurantDetail.id,
      );
      favoritesIconProvider.setFavorite(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    final descriptionProvider = context.watch<DetailDescriptionProvider>();
    final favoriteProvider = context.read<FavoritesProvider>();
    final favoritesIconProvider = context.watch<FavoritesIconProvider>();

    return CustomScrollView(
      slivers: <Widget>[
        AppbarOfDetail(restaurantDetail: widget.restaurantDetail),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Restaurant Detail Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.restaurantDetail.name,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),

                    /// Favorites Button
                    IconButton(
                      onPressed: () async {
                        if (favoritesIconProvider.isFavorite) {
                          await favoriteProvider.deleteFavorites(
                            widget.restaurantDetail.id,
                          );
                          favoritesIconProvider.setFavorite(false);
                        } else {
                          await favoriteProvider.addFavorites(
                            Favorite(
                              id: widget.restaurantDetail.id,
                              name: widget.restaurantDetail.name,
                              city: widget.restaurantDetail.city,
                              rating: widget.restaurantDetail.rating.toDouble(),
                              pictureId: widget.restaurantDetail.pictureId,
                            ),
                          );
                          favoritesIconProvider.setFavorite(true);
                        }
                      },
                      icon: Icon(
                        favoritesIconProvider.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: favoritesIconProvider.isFavorite
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                /// Restaurant Detail Address
                DefaultTextStyle(
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                  child: Row(
                    children: [
                      /// Restaurant Detail City
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Text(widget.restaurantDetail.city),
                        ),
                      ),
                      Icon(
                        Icons.circle,
                        size: 9,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),

                      /// Restaurant Detail address
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          widget.restaurantDetail.address,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(color: Color.fromARGB(128, 0, 0, 0)),

                /// Restaurant Category & Rating
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Category
                      SizedBox(
                        height: 20,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.restaurantDetail.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            var category = widget.restaurantDetail.categories;

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.circle, size: 10),
                                  SizedBox.square(dimension: 5),
                                  Text(category[index].name),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      /// Rating
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Text(
                              'Rating: ',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            SizedBox.square(dimension: 4),
                            Icon(
                              Icons.star,
                              color: const Color.fromARGB(255, 207, 186, 0),
                            ),
                            SizedBox.square(dimension: 4),
                            Text(widget.restaurantDetail.rating.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Restaurant Detail Description
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Restaurant Description
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                widget.restaurantDetail.description,
                                style: Theme.of(context).textTheme.bodyLarge,
                                overflow:
                                    descriptionProvider.isDescriptionExpanded
                                    ? null
                                    : TextOverflow.ellipsis,
                                maxLines:
                                    descriptionProvider.isDescriptionExpanded
                                    ? null
                                    : 5,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                descriptionProvider.onPresssed();
                              },
                              child: Text(
                                descriptionProvider.isDescriptionExpanded
                                    ? 'more'
                                    : 'less',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// Restaurant Menus Display
                MenuCategoryOfDetail(
                  restaurantDetailMenus: widget.restaurantDetail,
                ),

                /// Restaurant Customer Review Display
                ReviewOfDetail(restaurantDetail: widget.restaurantDetail),

                /// Add Restaurant Review
                AddReview(restaurantDetail: widget.restaurantDetail),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
