import 'package:get/get.dart';

import '../controllers/companion_info_controller.dart';

class CompanionInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanionInfoController>(
      () => CompanionInfoController(),
    );
  }
}
