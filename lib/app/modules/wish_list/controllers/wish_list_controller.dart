import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../../data/models/hotel_wish_list.dart';
import '../../../service/api_link.dart';

class WishListController extends GetxController {
  //TODO: Implement WishListController
  var taxiList = <HotelWishListModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getWishlist();
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

  void getWishlist() async {
    var response = await http.get(Uri.parse('${baseUrl}api/taxiallshow'),
        headers: ApiLinks().requestHeaders);
    print(response.statusCode);
    print(response.body);

    var jsonData = response.body;
    taxiList = hotelWishListModelFromJson(jsonData).obs;
  }
}
