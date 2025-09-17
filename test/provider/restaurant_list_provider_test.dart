import 'package:assestment_restaurant_app/core/data/model/response/add_review_response_restaurant.dart';
import 'package:assestment_restaurant_app/core/data/model/response/restaurant_detail_response.dart';
import 'package:assestment_restaurant_app/core/data/model/response/restaurant_list_response.dart';
import 'package:assestment_restaurant_app/core/data/model/restaurant/restaurant.dart';
import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/customer_review/customer_review.dart';
import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/menu/menu.dart';
import 'package:assestment_restaurant_app/core/data/model/restaurant_detail/retaurant_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assestment_restaurant_app/core/provider/restaurant_list/restaurant_list_provider.dart';
import 'package:assestment_restaurant_app/core/data/api/api_services.dart';
import 'package:assestment_restaurant_app/static/restaurant_list_state.dart';

/// Fake service success
class FakeApiServicesSuccess extends ApiServices {
  @override
  Future<RestaurantListResponse> getRestaurantlist() async {
    return RestaurantListResponse(
      error: false,
      message: "success",
      count: 1,
      restaurants: [
        Restaurant(
          id: '1',
          name: 'Warung Sate',
          city: 'Jakarta',
          rating: 4.5,
          pictureId: 'pic1', description: 'lorem lerum dolor dolores',
        ),
      ],
    );
  }

  @override
  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final detail = RestaurantDetail(
      id: '1',
      name: 'Warung Sate',
      description: 'Warung sate terenak di Jakarta',
      city: 'Jakarta',
      address: 'Jl. Sudirman No. 1',
      pictureId: 'pic1',
      categories: [
        Category(name: 'Sate'),
        Category(name: 'Indonesia'),
      ],
      menus: Menus(
        foods: [Category(name: 'Sate Ayam')],
        drinks: [Category(name: 'Es Teh')],
      ),
      rating: 4.5,
      customerReviews: [
        CustomerReview(
          name: 'Budi',
          review: 'Enak sekali!',
          date: '2025-09-16',
        ),
      ],
    );

    return RestaurantDetailResponse(
      error: false,
      message: "success",
      restaurant: detail,
    );
  }

  @override
  Future<AddReviewRestaurantResponse> addReviewRestaurant(
    String id,
    String name,
    String review,
  ) async {
    return AddReviewRestaurantResponse(
      error: false,
      message: "success",
      customerReviews: [
        CustomerReview(name: name, review: review, date: "2025-09-16"),
      ],
    );
  }
}

/// Fake service error
class FakeApiServicesError extends ApiServices {
  @override
  Future<RestaurantListResponse> getRestaurantlist() async {
    throw Exception("Network error simulated");
  }

  @override
  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    throw Exception("Detail fetch error simulated");
  }

  @override
  Future<AddReviewRestaurantResponse> addReviewRestaurant(
    String id,
    String name,
    String review,
  ) async {
    throw Exception("Add review error simulated");
  }
}

void main() {
  group('RestaurantListProvider (unit)', () {
    test(
      'State awal provider harus didefinisikan (RestaurantListStateNone)',
      () {
        final provider = RestaurantListProvider(FakeApiServicesSuccess());

        expect(provider.listState, isA<RestaurantListState>());
        expect(provider.listState.runtimeType, RestaurantListStateNone);
      },
    );

    test('Mengembalikan daftar restoran ketika API sukses', () async {
      final provider = RestaurantListProvider(FakeApiServicesSuccess());

      await provider.fetchRestaurantList();

      final state = provider.listState;
      expect(state, isA<RestaurantListStateLoaded>());

      if (state is RestaurantListStateLoaded) {
        expect(state.data.length, 1); 
        expect(state.data[0].name, 'Warung Sate');
      }
    });

    test('Mengembalikan error ketika pengambilan data gagal', () async {
      final provider = RestaurantListProvider(FakeApiServicesError());

      await provider.fetchRestaurantList();

      final state = provider.listState;
      expect(state, isA<RestaurantListStateError>());

      if (state is RestaurantListStateError) {
        expect(state.error, isNotEmpty);
      }
    });
  });
}
