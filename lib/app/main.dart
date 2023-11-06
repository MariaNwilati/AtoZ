import 'package:atoz/app/modules/home/views/home_view.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/modules/splash_screen/views/splash_screen_view.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  GetStorage authBox = GetStorage();
  var token = await authBox.read('token');

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "A TO Z",
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
      ),
      // themeMode: themesController.theme,
      //theme: Themes.lightTheme,
      //darkTheme: Themes.darkTheme,
      home: token == '' ? HomeView() : const SplashScreen(),
    ),
  );
}

class Themes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(),
  );
  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(),
  );
}
