import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../../../data/models/constants.dart';
import '../../../routes/app_pages.dart';
import '../../book_hotel/views/book_hotel_view.dart';
import '../controllers/wish_list_controller.dart';

class WishListView extends GetView<WishListController> {
  const WishListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(WishListController());

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
              title: const Text('Your WishList',
                  style: TextStyle(color: Colors.white)),
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 13.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Obx(() {
                    return ListView.builder(itemCount: controller.taxiList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Get.toNamed(Routes.HOTEL_DETAILS);
                              },
                              child: HotelCard(
                                  location: controller
                                      .taxiList[index].hotels.location,
                                  name: controller.taxiList[index].hotels.name,
                                  stars: controller.taxiList[index].hotels.stars
                                      .toDouble()),
                            ));
                  }),
                ))));
  }
}

class HotelCard extends StatelessWidget {
  const HotelCard(
      {Key? key,
      required this.name,
      required this.stars,
      required this.location})
      : super(key: key);
  final String name;
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
              child: Image.asset(
                'assets/images/diverxo.jpg',
                fit: BoxFit.fill,
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
