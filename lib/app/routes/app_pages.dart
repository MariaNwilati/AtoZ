import 'package:get/get.dart';

import '../modules/book_hotel/bindings/book_hotel_binding.dart';
import '../modules/book_hotel/views/book_hotel_view.dart';
import '../modules/book_restaurant/bindings/book_restaurant_binding.dart';
import '../modules/book_restaurant/views/book_restaurant_view.dart';
import '../modules/companion_info/bindings/companion_info_binding.dart';
import '../modules/companion_info/views/companion_info_view.dart';
import '../modules/companion_list/bindings/companion_list_binding.dart';
import '../modules/companion_list/views/companion_list_view.dart';
import '../modules/couponitem/bindings/couponitem_binding.dart';
import '../modules/couponitem/views/couponitem_view.dart';
import '../modules/coupons/bindings/coupons_binding.dart';
import '../modules/coupons/views/coupons_view.dart';
import '../modules/flight/bindings/flight_binding.dart';
import '../modules/flight/views/flight_view.dart';
import '../modules/flight_details/bindings/flight_details_binding.dart';
import '../modules/flight_details/views/flight_details_view.dart';
import '../modules/flights_list/bindings/flights_list_binding.dart';
import '../modules/flights_list/views/flights_list_view.dart';
import '../modules/home/bindings/home_binding.dart';

import '../modules/home/views/home_view.dart';

import '../modules/hotel_details/bindings/hotel_details_binding.dart';
import '../modules/hotel_details/views/hotel_details_view.dart';
import '../modules/hotels_list/bindings/hotels_list_binding.dart';
import '../modules/hotels_list/views/hotels_list_view.dart';
import '../modules/map/bindings/map_binding.dart';
import '../modules/map/views/map_view.dart';
import '../modules/place/bindings/place_binding.dart';
import '../modules/place/views/place_view.dart';
import '../modules/place_categories/bindings/place_categories_binding.dart';
import '../modules/place_categories/views/place_categories_view.dart';
import '../modules/places_list/bindings/places_list_binding.dart';
import '../modules/places_list/views/places_list_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/restaurant_details/bindings/restaurant_details_binding.dart';
import '../modules/restaurant_details/views/restaurant_details_view.dart';
import '../modules/restaurants_list/bindings/restaurants_list_binding.dart';
import '../modules/restaurants_list/views/restaurants_list_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/taxi/bindings/taxi_binding.dart';
import '../modules/taxi/views/taxi_view.dart';
import '../modules/taxi_info/bindings/taxi_info_binding.dart';
import '../modules/taxi_info/views/taxi_info_view.dart';
import '../modules/themes/bindings/themes_binding.dart';
import '../modules/themes/views/themes_view.dart';
import '../modules/user_flights/bindings/user_flights_binding.dart';
import '../modules/user_flights/views/user_flights_view.dart';
import '../modules/user_hotels/bindings/user_hotels_binding.dart';
import '../modules/user_hotels/views/user_hotels_view.dart';
import '../modules/user_restaurants/bindings/user_restaurants_binding.dart';
import '../modules/user_restaurants/views/user_restaurants_view.dart';
import '../modules/welcome1/bindings/welcome1_binding.dart';
import '../modules/welcome1/views/welcome1_view.dart';
import '../modules/welcome2/bindings/welcome2_binding.dart';
import '../modules/welcome2/views/welcome2_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>   HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.PLACES_LIST,
    //   page: () => const PlacesListView(),
    //   binding: PlacesListBinding(),
    // ),
    GetPage(
      name: _Paths.PLACE,
      page: () => const PlaceView(),
      binding: PlaceBinding(),
    ),
    GetPage(
      name: _Paths.FLIGHT,
      page: () => const FlightView(),
      binding: FlightBinding(),
    ),
    GetPage(
      name: _Paths.FLIGHTS_LIST,
      page: () => const FlightsListView(),
      binding: FlightsListBinding(),
    ),
    GetPage(
      name: _Paths.FLIGHT_DETAILS,
      page: () => const FlightDetailsView(),
      binding: FlightDetailsBinding(),
    ),
    GetPage(
      name: _Paths.USER_FLIGHTS,
      page: () => const UserFlightsView(),
      binding: UserFlightsBinding(),
    ),
    GetPage(
      name: _Paths.USER_HOTELS,
      page: () => const UserHotelsView(),
      binding: UserHotelsBinding(),
    ),
    GetPage(
      name: _Paths.USER_RESTAURANTS,
      page: () => const UserRestaurantsView(),
      binding: UserRestaurantsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    /* GetPage(
      name: _Paths.MAP,
      page: () => const MapView(),
      binding: MapBinding(),
    ),*/
    GetPage(
      name: _Paths.THEMES,
      page: () => const ThemesView(),
      binding: ThemesBinding(),
    ),
    // GetPage(
    //   name: _Paths.COMPANION_INFO,
    //   page: () =>   CompanionInfoView(),
    //   binding: CompanionInfoBinding(),
    // ),
    GetPage(
      name: _Paths.BOOK_HOTEL,
      page: () => BookHotelView(),
      binding: BookHotelBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_RESTAURANT,
      page: () => BookRestaurantView(),
      binding: BookRestaurantBinding(),
    ),

    GetPage(
      name: _Paths.HOTELS_LIST,
      page: () => const HotelsListView(),
      binding: HotelsListBinding(),
    ),
    // GetPage(
    //   name: _Paths.RESTAURANT_DETAILS,
    //   page: () => const RestaurantDetailsView(),
    //   binding: RestaurantDetailsBinding(),
    // ),
    GetPage(
      name: _Paths.RESTAURANTS_LIST,
      page: () => const RestaurantsListView(),
      binding: RestaurantsListBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME2,
      page: () => const Welcome2View(),
      binding: Welcome2Binding(),
    ),
    GetPage(
      name: _Paths.COMPANION_LIST,
      page: () => const CompanionListView(),
      binding: CompanionListBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    // GetPage(
    // name: _Paths.TAXI_INFO,
    // page: () => const TaxiInfoView(),
    // binding: TaxiInfoBinding(),
    // ),
    GetPage(
      name: _Paths.TAXI,
      page: () => TaxiView(),
      binding: TaxiBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME1,
      page: () => const Welcome1View(),
      binding: Welcome1Binding(),
    ),
    GetPage(
      name: _Paths.PLACE_CATEGORIES,
      page: () => const PlaceCategoriesView(),
      binding: PlaceCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.COUPONS,
      page: () => const CouponsView(),
      binding: CouponsBinding(),
    ),
    // GetPage(
    //   name: _Paths.COUPONITEM,
    //   page: () => const CouponitemView(),
    //   binding: CouponitemBinding(),
    // ),
  ];
}
