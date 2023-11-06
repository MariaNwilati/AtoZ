import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../sign_in/views/sign_in_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final GetStorage authBox = GetStorage();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void signOutFromApp() {
    authBox.remove('token');
    authBox.remove('firstName');
    authBox.remove('email');
    Get.offAll(const SignInView(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 700));
    update();
    authBox.remove('token');
  }
}
