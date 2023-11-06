import 'package:atoz/app/data/models/taxi_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/taxi_service.dart';

class TaxiInfoController extends GetxController {
  var isLikeButtonClicked = false;
  late TaxiDetailsModelResponse taxiDetails;

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

  void specificTaxi(int id) async {
    var taxi = await TaxiService().getTaxiCountry(id);
    taxiDetails = taxi;
  }
}
