import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../service/api_link.dart';
import '../../home/views/home_view.dart';

class HotelDetailsController extends GetxController {
  final favKey = 'isfavKey';
  final fav = GetStorage();

  bool get isfavkey => false;

  var newItem = 'Single Room  1000\$'.obs;

  List<String> values = [
    'Single Room  1000\$',
    'Double Room 1500\$',
    'Deluxe Room 2000\$',
    'Room with view 2500\$',
    'Suite 3500\$',
    'Presidental Suite 5000\$',
  ].obs;

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

  void savefave(bool isfavkey) => fav.write(favKey, isfavkey);

  void addToFavorite(int id) async {
    var response = await http.post(Uri.parse('${baseUrl}api/storehs'),
        body: {'hotel_id': 1}, headers: ApiLinks().requestHeaders);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.snackbar("successful ", "successful",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white);

      Get.off(HomeView(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 700));
    } else {
      Get.snackbar("Field", "some thing went wrong ",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white);
    }
  }
}
