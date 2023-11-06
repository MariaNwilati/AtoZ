import 'package:atoz/app/data/models/place_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../service/api_link.dart';

class PlaceCategoriesController extends GetxController {
  //TODO: Implement PlaceCategoriesController

  final count = 0.obs;
  var placesList = <PlaceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPlaces();
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
  void getPlaces() async {
    var response = await http.get(Uri.parse('${baseUrl}api/tourallshow'),
        headers: ApiLinks().requestHeaders);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      placesList = placeModelFromJson(jsonData).obs;
      update();
    } else {
      // print(response.body);
    }
    update();
  }
}
