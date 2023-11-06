import 'package:get/get.dart';

import '../controllers/flights_list_controller.dart';

class FlightsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlightsListController>(
      () => FlightsListController(),
    );
  }
}
