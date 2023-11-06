import 'package:atoz/app/data/models/hotel_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../service/api_link.dart';

class HotelsListController extends GetxController {
  var isloading = false.obs;

  final count = 0.obs;
  var hotelList = <HotelModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getHotel();
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

  void getHotel() async {
    try {
      isloading(true);
      var response = await http.get(Uri.parse('${baseUrl}api/hotelallshow'),
          headers: ApiLinks().requestHeaders);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var jsonData = response.body;
        hotelList = hotelModelFromJson(jsonData).obs;
        
      } else {
        // print(response.body);
      }
      
    } finally {
      isloading(false);
    }
  }
}
