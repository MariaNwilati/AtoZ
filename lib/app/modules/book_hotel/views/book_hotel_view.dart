import 'package:atoz/app/data/models/hotel_model.dart';
import 'package:atoz/app/routes/app_pages.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/constants.dart';
import '../controllers/book_hotel_controller.dart';

class BookHotelView extends GetView<BookHotelController> {
  BookHotelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BookHotelController());
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
                Get.toNamed(Routes.HOTEL_DETAILS);
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
              'Book Your Room',
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
                height: 370,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => controller.showDate(),
                        child: Container(
                          width: 250,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                              const SizedBox(
                                width: 110,
                              ),
                              Icon(Icons.arrow_right_outlined,
                                  color: Colors.grey[700]),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: 250,
                          height: 60,
                          child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                              ),
                              value: controller.selectedValue.value,
                              items: controller.values
                                  .map((value) => DropdownMenuItem<String>(
                                      value: value.isNotEmpty ? value : null,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(value,
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 15)),
                                      )))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedValue.value =
                                    value as String;
                              })),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 230,
                        child: TextFormField(
                          onChanged: (value) {
                            controller.days.value = value;
                          },
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.black26,
                              ),
                              hintText: 'Duration of stay',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Comfortaa',
                                fontSize: 15,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.only(top: 550, left: 45.0),
              child: Container(
                width: 330,
                height: 50,
                decoration: const BoxDecoration(
                  color: orange,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: MaterialButton(
                  onPressed: () {
                    controller.bookHotel();
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
              )),
        ]));
  }
}
