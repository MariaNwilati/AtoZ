import 'package:atoz/app/data/models/companion_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../service/api_link.dart';

class CompanionListController extends GetxController {
  //TODO: Implement CompanionListController

  var isloading = false.obs;
  var escortList = <EscortModel>[].obs;

  @override
  void onInit() {
    getEscort();
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

  

  void getEscort() async {
    try {
      isloading(true);

      var response = await http.get(Uri.parse('${baseUrl}api/allescort'),
          headers: ApiLinks().requestHeaders);
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var jsonData = response.body;
        escortList = escortModelFromJson(jsonData).obs;
        update();
      } else {
        // print(response.body);
      }
      update();
    } finally {
      isloading(false);
    }
  }
}
