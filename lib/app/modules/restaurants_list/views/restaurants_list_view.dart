
import 'package:atoz/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../../../data/models/constants.dart';

import '../../../service/api_link.dart';
import '../../restaurant_details/views/restaurant_details_view.dart';
import '../controllers/restaurants_list_controller.dart';

class RestaurantsListView extends GetView<RestaurantsListController> {
  const RestaurantsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(RestaurantsListController());

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: orange,
              leading: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.HOME);
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.white)),
              title: const Text('Restaurants',
                  style: TextStyle(color: Colors.white)),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 13.0),
                child: Obx(() {
                  if (controller.isloading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return GestureDetector(
                      onTap: () {},
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.resturantList.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(RestaurantDetailsView(
                                      image: controller
                                          .resturantList[index].imgUrl,
                                      initRating: controller
                                          .resturantList[index].stars
                                          .toDouble(),
                                      restaurantsName:
                                          controller.resturantList[index].name,
                                      restaurantsLocation: controller
                                          .resturantList[index].location,
                                      restaurantsCity: controller
                                          .resturantList[index]
                                          .covernorates
                                          .name,
                                      restaurantsViews: controller
                                          .resturantList[index].views
                                          .toString(),
                                      restaurantsOpenhour: controller
                                          .resturantList[index].openTime,
                                      restaurantsClosehour: controller
                                          .resturantList[index].closeTime,
                                      restaurantsPhonenumber: controller
                                          .resturantList[index].phone));
                                },
                                child: RestaurantCard(
                                    image:
                                        controller.resturantList[index].imgUrl,
                                    name: controller.resturantList[index].name,
                                    rate: controller.resturantList[index].stars
                                        .toDouble(),
                                    location: controller
                                        .resturantList[index].location),
                              )),
                    );
                  }
                }))));
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.rate,
      required this.location})
      : super(key: key);
  final String image;
  final String location;
  final String name;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              // ignore: sort_child_properties_last
              child: Image(
                fit: BoxFit.fill,
                image: NetworkImage(
                  '${baseUrl}img_url/$image',
                ),
              ),
              height: 100.0,
              width: 90.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0),
                borderRadius: BorderRadius.circular(90),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            Text(location,
                style: TextStyle(fontSize: 15, color: Colors.grey[700])),
            const SizedBox(
              height: 5.0,
            ),
            RatingBar.builder(
                unratedColor: Colors.grey[300],
                itemSize: 20,
                initialRating: rate,
                itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: orange,
                    ),
                onRatingUpdate: (rating) {})
          ],
        )
      ],
    );
  }
}
