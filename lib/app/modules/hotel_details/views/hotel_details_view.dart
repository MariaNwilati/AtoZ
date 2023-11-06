import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:favorite_button/favorite_button.dart';
import '../../../data/models/constants.dart';
import '../../../routes/app_pages.dart';
import '../../../service/api_link.dart';
import '../../hotels_list/controllers/hotels_list_controller.dart';
import '../controllers/hotel_details_controller.dart';

class HotelDetailsView extends GetView<HotelDetailsController> {
  const HotelDetailsView(
      {required this.id,
      required this.image,
      required this.views,
      required this.name,
      required this.location,
      required this.city,
      required this.phone,
      required this.stars,
      Key? key})
      : super(key: key);
  final String name;
  final String location;
  final String city;
  final String image;
  final String phone;
  final String views;
  final double stars;
  final int id;

  @override
  Widget build(BuildContext context) {
    Get.put(HotelDetailsController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          centerTitle: true,
          title: Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            color: Colors.black,
            onPressed: () {
              Get.toNamed(Routes.HOTELS_LIST);
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
          backgroundColor: orange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: SingleChildScrollView(
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
                        Text(name, style: const TextStyle(fontSize: 20.0)),
                        const SizedBox(width: 110.0),
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
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('$location , $city',
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.black)),
                        const SizedBox(width: 155.0),
                        Icon(
                          Icons.visibility,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(views,
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.black))
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 60.0, bottom: 8.0),
                      child: Text(
                        'type of rooms:',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                    //const SizedBox(height: 5),
                    SizedBox(
                        width: 250,
                        height: 60,
                        child: DropdownButtonFormField<String>(
                          value: controller.newItem.value,
                          items: controller.values
                              .map((value) => DropdownMenuItem<String>(
                                  value: value.isNotEmpty ? value : null,
                                  child: Text(value,
                                      style: const TextStyle(fontSize: 15))))
                              .toList(),
                          onChanged: (value) {
                            controller.newItem.value = value as String;
                          },
                        )),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        Text('contact us : $phone',
                            style: const TextStyle(fontSize: 17)),
                      ],
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FavoriteButton(
                            isFavorite: false,
                            iconSize: 40,
                            valueChanged: () {
                              controller.savefave(true);
                              controller.addToFavorite(id);
                            }),
                        Center(
                            child: FloatingActionButton.extended(
                                onPressed: () {
                                  Get.toNamed(Routes.BOOK_HOTEL);
                                },
                                backgroundColor: orange,
                                foregroundColor: Colors.white,
                                label: const Text(
                                  'Make a reservation',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ))),
                      ],
                    ),
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
