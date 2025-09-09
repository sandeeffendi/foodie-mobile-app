import 'package:assestment_restaurant_app/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:assestment_restaurant_app/util/detail/add_customer_review/add_review.dart';
import 'package:assestment_restaurant_app/util/detail/appbar_of_detail.dart';
import 'package:assestment_restaurant_app/util/detail/menu_category_of_detail.dart';
import 'package:assestment_restaurant_app/util/detail/review_of_detail.dart';
import 'package:flutter/material.dart';

class BodyOfDetail extends StatefulWidget {
  final RestaurantDetail restaurantDetail;

  const BodyOfDetail({super.key, required this.restaurantDetail});

  @override
  State<BodyOfDetail> createState() => _BodyOfDetailState();
}

class _BodyOfDetailState extends State<BodyOfDetail> {
  bool _isDescriptionExpanded = true;

  void expandedDescription() {
    setState(() {
      _isDescriptionExpanded = !_isDescriptionExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // physics: const BouncingScrollPhysics(),
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
                Text(
                  widget.restaurantDetail.name,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
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
                                overflow: _isDescriptionExpanded
                                    ? TextOverflow.ellipsis
                                    : null,
                                maxLines: _isDescriptionExpanded ? null : 5,
                              ),
                            ),
                            TextButton(
                              onPressed: expandedDescription,
                              child: Text(
                                _isDescriptionExpanded ? 'more' : 'less',
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

/// comment ini seharusnya di reset
/// ini juga seharusnya di reset
