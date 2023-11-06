
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../../../data/models/taxi_model.dart';
import '../../../service/api_link.dart';

class TaxiController extends GetxController {
  //TODO: Implement TaxiController
  var taxiList = <AllTaxiDetailsModelResponse>[].obs;
  String taxiDetails = '';
  var isLoadin = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getTaxi();
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

  void getTaxi() async {
    try {
      isLoadin(true);

      var response = await http.get(Uri.parse('${baseUrl}api/taxiallshow'),
          headers: ApiLinks().requestHeaders);
      print(response.statusCode);
      print(response.body);

      var jsonData = response.body;
      taxiList = allTaxiDetailsModelResponseFromJson(jsonData).obs;
    } finally {
      isLoadin(false);
    }
  }
}
