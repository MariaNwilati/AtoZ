import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '';
import '../../../data/models/place_model.dart';
class PlaceController extends GetxController {
  //TODO: Implement PlaceController


  final favKey='isfavKey';
  final fav= GetStorage();

  bool get isfavkey => false;
  @override
  //late bool fav;
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
  void savefave(bool isfavkey)=> fav.write(favKey, isfavkey);



}
