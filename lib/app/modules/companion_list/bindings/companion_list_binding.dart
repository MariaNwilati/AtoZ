import 'package:get/get.dart';

import '../controllers/companion_list_controller.dart';

class CompanionListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanionListController>(
      () => CompanionListController(),
    );
  }
}
