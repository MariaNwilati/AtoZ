import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemesController extends GetxController {
  //TODO: Implement ThemesController

  final box= GetStorage();
  final key= 'isDarkMode';
  final count = 0.obs;
  @override

  ThemeMode get theme=> loadTheme()? ThemeMode.dark: ThemeMode.light;
  bool loadTheme()=> box.read(key)??false;
  void saveTheme(bool isDarkMode)=> box.write(key, isDarkMode);
  void changeTheme(ThemeData theme)=> Get.changeTheme(theme);
  void changeThemeMode (ThemeMode themeMode)=> Get.changeThemeMode(themeMode);
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
