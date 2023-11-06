import 'package:atoz/app/modules/wish_list/views/wish_list_view.dart';
import 'package:atoz/app/routes/app_pages.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../couponitem/views/couponitem_view.dart';
import '../../coupons/views/coupons_view.dart';
import '../../themes/controllers/themes_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  GetStorage authBox = GetStorage();
  static final themesController = Get.put(ThemesController());
  //static const moon_icon= Icon(CupertinoIcons.moon_stars);
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            color: Colors.white,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          'A To Z Travel',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(
                  10.0,
                ),
                child: Row(children: [
                  const Icon(
                    Icons.search,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text('Search'),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Lets start planning!',
                    style: const TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.FLIGHT);
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 7.0,
                                  // spreadRadius: 0.1,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            margin: const EdgeInsets.all(10.0),
                            padding: const EdgeInsets.all(13),
                            child: Image.asset(
                                'assets/images/6811925_aircraft_airplane_aviation_plane_transport_icon.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.HOTELS_LIST),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 7.0,
                                  // spreadRadius: 0.1,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(18),
                            child: Image.asset(
                              'assets/images/3671797_hotel_location_icon.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(Routes.TAXI),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                blurRadius: 7.0,
                                // spreadRadius: 0.1,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                              'assets/images/8541772_car_transport_icon.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.COMPANION_LIST),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                blurRadius: 7.0,
                                // spreadRadius: 0.1,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                              'assets/images/211857_man_icon.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(Routes.RESTAURANTS_LIST),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                blurRadius: 7.0,
                                // spreadRadius: 0.1,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                              'assets/images/9035012_restaurant_icon.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill),
                        ),
                      ),
                      const SizedBox(
                        width: 90,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(Routes.PLACE_CATEGORIES),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                blurRadius: 7.0,
                                // spreadRadius: 0.1,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                              'assets/images/4308424_australia_australian_country_independence_location_icon.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.white10),
              accountName: Text(
                authBox.read('firstName'),
                style: const TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
             
              accountEmail: Text(
                authBox.read('email'),
                style: const TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.account_circle,
                color: const Color(0xffff9114),
              ),
              title: const Text(
                'My Profile',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15),
              ),
              onTap: () {
                Get.toNamed(Routes.PROFILE);
              },
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),

            ListTile(
              leading: const Icon(
                Icons.discount_rounded,
                color: Color(0xffff9114),
              ),
              title: const Text(
                'Coupons',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15),
              ),
              onTap: () {
                Get.to(const CouponsView());
              },
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Color(0xffff9114),
              ),
              title: const Text(
                'wishList',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15),
              ),
              onTap: () {
                Get.to(const WishListView());
              },
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),

            // SizedBox(height: 200,),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Color(0xffff9114),
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15),
              ),
              onTap: () {
                controller.signOutFromApp();
              },
            ),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
