import 'package:atoz/app/modules/places_list/views/places_list_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/place_categories_controller.dart';

class PlaceCategoriesView extends GetView<PlaceCategoriesController> {
  const PlaceCategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(PlaceCategoriesController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.to(PlacesListView('ss')),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                      'assets/images/photo-1507525428034-b723cf961d3e.jpg',
                      width: 500,
                      height: 270,
                      fit: BoxFit.cover),
                  Positioned(
                    top: 20,
                    left: 5,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () => Get.back(),
                    ),
                  ),
                  Text(
                    'Coast',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 15,),
            InkWell(
              onTap: () => Get.toNamed(Routes.PLACES_LIST),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                      'assets/images/Switzerland-Oeschinnensee-lake-Berner-Oberland.jpg',
                      width: 500,
                      height: 270,
                      fit: BoxFit.cover),
                  Text(
                    'Nature',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 15,),
            InkWell(
              onTap: () => Get.toNamed(Routes.PLACES_LIST),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/Egypt-desert.jpg',
                      width: 500, height: 270, fit: BoxFit.cover),
                  Text(
                    'Desert',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Comfortaa',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
