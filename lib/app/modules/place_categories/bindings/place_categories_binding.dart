import 'package:get/get.dart';

import '../controllers/place_categories_controller.dart';

class PlaceCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaceCategoriesController>(
      () => PlaceCategoriesController(),
    );
  }
}
