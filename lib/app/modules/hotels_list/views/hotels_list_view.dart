import 'package:atoz/app/modules/hotel_details/views/hotel_details_view.dart';
import 'package:atoz/app/service/api_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../../../data/models/constants.dart';
import '../../../data/models/hotel_model.dart';
import '../../../routes/app_pages.dart';
import '../../book_hotel/views/book_hotel_view.dart';
import '../controllers/hotels_list_controller.dart';

class HotelsListView extends GetView<HotelsListController> {
  const HotelsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HotelsListController());

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: orange,
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () => Get.toNamed(Routes.HOME),
                ),
              ),
              title:
                  const Text('Hotels', style: TextStyle(color: Colors.white)),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 13.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Obx(() {
                    if (controller.isloading.value) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.hotelList.length,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(HotelDetailsView(
                                      id: controller.hotelList[index].id,
                                      image: controller.hotelList[index].imgUrl,
                                      views: controller.hotelList[index].views
                                          .toString(),
                                      name: controller.hotelList[index].name,
                                      location:
                                          controller.hotelList[index].location,
                                      city: controller
                                          .hotelList[index].covernorates.name,
                                      phone: controller.hotelList[index].phone,
                                      stars: controller.hotelList[index].stars
                                          .toDouble()));
                                },
                                child: HotelCard(
                                  location:
                                      controller.hotelList[index].location,
                                  name: controller.hotelList[index].name,
                                  image: controller.hotelList[index].imgUrl,
                                  stars: controller.hotelList[index].stars
                                      .toDouble(),
                                ),
                              ));
                    }
                  }),
                ))));
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.stars,
      required this.location})
      : super(key: key);
  final String name;
  final String image;
  final double stars;
  final String location;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
                height: 100.0,
                width: 90.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0),
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    '${baseUrl}img_url/$image',
                  ),
                )),
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
            RatingBar.builder(
                unratedColor: Colors.grey[300],
                itemSize: 20,
                initialRating: stars,
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
