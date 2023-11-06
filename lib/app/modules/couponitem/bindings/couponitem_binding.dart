import 'package:get/get.dart';

import '../controllers/couponitem_controller.dart';

class CouponitemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponitemController>(
      () => CouponitemController(),
    );
  }
}
