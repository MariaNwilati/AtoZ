import 'package:atoz/app/modules/companion_info/views/companion_info_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/companion_list_controller.dart';

class CompanionListView extends GetView<CompanionListController> {
  const CompanionListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    compMenu(
            {required String photoUrl,
            required String name,
            required String country,
            required String language,
            required double price,
            required String phone}) =>
        InkWell(
          onTap: () => Get.to(CompanionInfoView(
            country: country,
            image: photoUrl,
            language: language,
            name: name,
            phone: phone,
            price: price.toString(),
          )),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: AspectRatio(
                aspectRatio: 13 / 2,
                child: Container(
                  child: Row(children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      // Todo:Photo Here
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Name: $name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'com',
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Country: $country",
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: 'com',
                            )),
                        Text("Phone: $phone",
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: 'com',
                            )),
                      ],
                    ),
                  ]),
                ),
              )),
        );
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        actions: const [],
        backgroundColor: const Color(0xffFF9114),
        elevation: 0,
        titleSpacing: 70,
        toolbarHeight: 50.0,
        title: const Text('Want a Companion ?',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Com',
            )),
      ),
      body: Center(
          child: Container(
        height: 800,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 0,
                blurRadius: 0,
              ),
            ]),
        child: Obx(() {
          if (controller.isloading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemBuilder: (context, index) => compMenu(
                  language: controller.escortList[index].langEscort[index].name,
                  price: controller.escortList[index].pricePerDay.toDouble(),
                  name: controller.escortList[index].fName,
                  country: controller.escortList[index].covernorates.name,
                  phone: controller.escortList[index].phone,
                  photoUrl: controller.escortList[index].phone),
              itemCount: controller.escortList.length,
              separatorBuilder: (context, index) => const Divider(
                  color: Colors.black26, endIndent: 10, indent: 10),
            );
          }
        }),
      )),
    );
  }
}
