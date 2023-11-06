import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../service/api_link.dart';

class BookHotelController extends GetxController {
  var selectedValue = 'Single Room  1000\$'.obs;
  List<String> values = [
    'Single Room  1000\$',
    'Double Room 1500\$',
    'Deluxe Room 2000\$',
    'Room with view 2500\$',
    'Suite 3500\$',
    'Presidental Suite 5000\$',
  ].obs;
  late final DateTime date;
  final days = ''.obs;
  var selected_date = DateTime.now().obs;
  final GetStorage authBox = GetStorage();

  var isLoading = false.obs;

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

  void chooseRoomType() {}


  // Show the modal that contains the CupertinoDatePicker
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

  void bookHotel() async {
    try {
      isLoading(true);

      var response =
          await http.post(Uri.parse('${baseUrl}api/storehbook'), body: {
        'enter_date': selected_date.value.toString(),
        'roomtype_id': 1.toString(),
        'user_id': authBox.read('userId').toString(),
        'days': days.value.toString()
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
        Get.toNamed(Routes.HOME);
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
