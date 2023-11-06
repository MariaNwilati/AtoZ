

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightController extends GetxController {
  //TODO: Implement FlightController

  final count = 0.obs;
  late final DateTime date;
var selected_date =DateTime.now().obs;


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

  late DateTime _chosenDateTime;

  // Show the modal that contains the CupertinoDatePicker
 showDate() async{
   DateTime? pickedDate= await showDatePicker(
     context: Get.context!,
     initialDate: selected_date.value,
     firstDate: DateTime(2000),
     lastDate: DateTime(2030),
   );
   if
   (pickedDate !=null && pickedDate!= selected_date.value)
     {
       selected_date.value=pickedDate;
     }


 }
}
