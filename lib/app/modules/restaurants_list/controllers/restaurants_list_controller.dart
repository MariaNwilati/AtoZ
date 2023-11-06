import 'package:get/get.dart';

import '../../../data/models/restaurant_model.dart';
import 'package:http/http.dart' as http;

import '../../../service/api_link.dart';

class RestaurantsListController extends GetxController {
  var isloading = false.obs;

  final count = 0.obs;
  var resturantList = <RestaurantModel>[].obs;

  @override
  void onInit() {
    getResturant();
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

  void getResturant() async {
    try {
      isloading(true);
      var response = await http.get(Uri.parse('${baseUrl}api/resturantallshow'),
          headers: ApiLinks().requestHeaders);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var jsonData = response.body;
        resturantList = restaurantModelFromJson(jsonData).obs;
        
      } else {
        // print(response.body);
      }
    } finally {
      isloading(false);
    }
  }
}
