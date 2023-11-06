import 'package:atoz/app/data/models/restaurant_model.dart';
import 'package:atoz/app/routes/app_pages.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/constants.dart';
import '../controllers/book_restaurant_controller.dart';

class BookRestaurantView extends GetView<BookRestaurantController> {
  BookRestaurantView({Key? key}) : super(key: key);
  // final double initRating;
  // final String restaurantsName;
  // final String restaurantsLocation;
  // final String restaurantsCity;
  // final String restaurantsViews;
  // final String restaurantsOpenhour;
  // final String restaurantsClosehour;
  // final String restaurantsPhonenumber;

  @override
  Widget build(BuildContext context) {
    var hours = '';
    Get.put(BookRestaurantController());

    return Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: orange,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Get.toNamed(Routes.HOME);
              },
            ),
          ),
        ),
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: 500,
            color: Colors.white70,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                )),
            child: const Text(
              'Book Your Table',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
              top: 110,
              right: 35,
              child: Container(
                width: 330,
                height: 410,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(orange),
                              ),
                              onPressed: () async {
                                controller.showDate();
                              },
                              child: const Text(
                                'Select Date',
                                style: TextStyle(color: Colors.white),
                              )),
                          const SizedBox(width: 70),
                          Obx(() {
                            return Text(
                              DateFormat("dd-MM-yyy")
                                  .format(controller.selected_date.value)
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Comfortaa',
                              ),
                            );
                          }),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 247,
                        height: 60,
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(),
                            value: controller.selectedItem,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: controller.items
                                .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(item,
                                        style: const TextStyle(fontSize: 15))))
                                .toList(),
                            onChanged: (item) {
                              controller.selectedItem = item as String;
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 230,
                        child: TextFormField(
                          onChanged: (value) {
                            hours = value;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.timelapse,
                                color: Colors.black26,
                              ),
                              hintText: 'hours',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontSize: 15,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 560, left: 45.0),
            child: Container(
              width: 330,
              height: 50,
              decoration: const BoxDecoration(
                color: orange,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: MaterialButton(
                onPressed: () {
                  controller.bookResturant(
                      dateTime: controller.selected_date.value,
                      time: hours,
                      selectedItem: controller.selectedItem);
                },
                child: const Text(
                  'BOOK NOW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
