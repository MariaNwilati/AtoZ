import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../service/api_link.dart';
import '../controllers/taxi_info_controller.dart';

class TaxiInfoView extends GetView<TaxiInfoController> {
  final String name;
  final String goverment;
  final String phone;
  final String image;
  final String price;
  const TaxiInfoView(
      {required this.image,
      required this.name,
      required this.goverment,
      required this.phone,
      required this.price,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TaxiInfoController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: AppBar(
          centerTitle: true,
          title: const Text(
            'Taxi info',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_sharp),
            color: Colors.white,
            onPressed: () {
              Get.back();
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
      body: Column(children: [
        const SizedBox(height: 40),
        text(name: name, goverment: goverment, phone: phone, price: price),
      ]),
    );
  }
}

Widget text(
    {required String name,
    required String phone,
    required String goverment,
    required String price}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Column(
      children: [
        Row(children: [
          const Text(
            'Name: ',
            style: TextStyle(
                color: Colors.black54, fontFamily: 'com', fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
        const Divider(),
        const SizedBox(height: 40),
        Row(children: [
          const Text(
            'Phone: ',
            style: TextStyle(
                color: Colors.black54, fontFamily: 'com', fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            phone,
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
        const Divider(),
        const SizedBox(height: 40),
        Row(children: [
          const Text(
            'Country: ',
            style: TextStyle(
                color: Colors.black54, fontFamily: 'com', fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            goverment,
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
        const Divider(),
        const SizedBox(height: 40),
        Row(children: [
          const Text(
            'Price per Km: ',
            style: TextStyle(
                color: Colors.black54, fontFamily: 'com', fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            price,
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
      ],
    ),
  );
}
