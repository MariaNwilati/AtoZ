import 'package:atoz/app/data/models/coupon_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../service/api_link.dart';

class CouponsController extends GetxController {
  //TODO: Implement CouponsController

  var isLoadin = false.obs;
  final count = 0.obs;
  var cuponList = <CuponModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getCupon();
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

  void getCupon() async {
    try {
      isLoadin(true);

      var response = await http.get(Uri.parse('${baseUrl}api/allcop'),
          headers: ApiLinks().requestHeaders);
      print(response.statusCode);
      print(response.body);

      var jsonData = response.body;
      cuponList = cuponModelFromJson(jsonData).obs;
    } finally {
      isLoadin(false);
    }
  }
}
