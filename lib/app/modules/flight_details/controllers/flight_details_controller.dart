import 'package:get/get.dart';

class FlightDetailsController extends GetxController {
  //TODO: Implement FlightDetailsController
  var dropdownValue = 'First Class 1000\$'.obs;

  List<String> items = [
    'First Class 1000\$',
    'Business Class 900\$',
    'Premium Economy Class 800\$',
    'Economy Class 700\$',

  ].obs;
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

  void increment() => count.value++;




}
