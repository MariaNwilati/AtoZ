import 'package:get/get.dart';

import '../controllers/book_restaurant_controller.dart';

class BookRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookRestaurantController>(
      () => BookRestaurantController(),
    );
  }
}
