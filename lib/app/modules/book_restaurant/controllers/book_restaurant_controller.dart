import 'package:atoz/app/routes/app_pages.dart';
import 'package:atoz/app/service/api_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BookRestaurantController extends GetxController {
  List<String> items = ['Normal Table', 'VIP Table'].obs;
  var selectedItem = 'Normal Table';
  var isLoading = false.obs;
  late final DateTime date;
  final GetStorage authBox = GetStorage();

  var selected_date = DateTime.now().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  late DateTime _chosenDateTime;

  // Show the modal that contains the CupertinoDatePicker

  @override
  void onClose() {
    super.onClose();
  }

  showDate() async {
    DateTime? pickedDate = await showDatePicker(
      builder: ((context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: Colors.orange)),
            child: child!);
      }),
      context: Get.context!,
      initialDate: selected_date.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selected_date.value) {
      selected_date.value = pickedDate;
    }
  }

  void bookResturant(
      {required dateTime, required time, required selectedItem}) async {
    try {
      isLoading(true);

      var response =
          await http.post(Uri.parse('${baseUrl}api/storerbook'), body: {
        'date': selected_date.value.toString(),
        'time': time.toString(),
        'table_id': 1.toString(),
      }, headers: {
        'Authorization': 'Bearer ${authBox.read('token')}',
        "Accept": "application/json"
      });
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Get.snackbar('Sucsseful', 'Sucsseful',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange);
        Get.offNamed(Routes.HOME);
      } else {
        Get.snackbar('Field', 'Try agin',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.orange);
      }
    } finally {
      isLoading(false);
    }
  }
}
