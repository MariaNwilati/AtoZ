import 'package:atoz/app/modules/book_restaurant/views/book_restaurant_view.dart';
import 'package:atoz/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../../../data/models/constants.dart';
import '../../../service/api_link.dart';
import '../controllers/restaurant_details_controller.dart';

class RestaurantDetailsView extends GetView<RestaurantDetailsController> {
  const RestaurantDetailsView(
      {required this.image,
      required this.initRating,
      required this.restaurantsName,
      required this.restaurantsLocation,
      required this.restaurantsCity,
      required this.restaurantsViews,
      required this.restaurantsOpenhour,
      required this.restaurantsClosehour,
      required this.restaurantsPhonenumber,
      Key? key})
      : super(key: key);
  final double initRating;
  final String restaurantsName;
  final String restaurantsLocation;
  final String restaurantsCity;
  final String restaurantsViews;
  final String restaurantsOpenhour;
  final String restaurantsClosehour;
  final String restaurantsPhonenumber;
  final String image;

  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantDetailsController());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          centerTitle: true,
          title: Text(
            restaurantsName,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            color: Colors.black,
            onPressed: () {
              Get.toNamed(Routes.RESTAURANTS_LIST);
            },
          ),
          flexibleSpace: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(
                '${baseUrl}img_url/$image',
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('$restaurantsName Restaurant',
                            style: const TextStyle(fontSize: 20.0)),
                        const SizedBox(width: 60.0),
                        RatingBar.builder(
                            unratedColor: Colors.grey[300],
                            itemSize: 20,
                            initialRating: initRating,
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: orange,
                                ),
                            onRatingUpdate: (rating) {})
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('${restaurantsLocation} , ${restaurantsCity}',
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.black)),
                        const SizedBox(width: 170.0),
                        Icon(
                          Icons.visibility,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(restaurantsViews,
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.black))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 50.0,
                      ),
                      child: Text(
                        'types of tables',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 160,
                      height: 55,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(border: InputBorder.none),
                        value: controller.selectedItem.value,
                        items: controller.items
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(item,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ))))
                            .toList(),
                        onChanged: (item) {
                          controller.selectedItem.value = item as String;
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                          'open from ${restaurantsOpenhour} to ${restaurantsClosehour}',
                          style: const TextStyle(fontSize: 17)),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text('contact us : ${restaurantsPhonenumber}',
                              style: const TextStyle(fontSize: 17)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60),
                    Center(
                        child: FloatingActionButton.extended(
                            onPressed: () {
                              Get.toNamed(Routes.BOOK_RESTAURANT);
                            },
                            backgroundColor: orange,
                            foregroundColor: Colors.white,
                            label: const Text(
                              'Make a reservation',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
