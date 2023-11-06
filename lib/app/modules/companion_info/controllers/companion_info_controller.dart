import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanionInfoController extends GetxController {
  var isLikeButtonClicked = false;
  var isDesLikeButtonClicked = false;
  var  iconColor= Colors.grey[600];

  final count = 0.obs;
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
void changelike(){
    iconColor = const Color(0xFFFF9114);
    update();
}

}
