import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/places_list_controller.dart';
import 'package:atoz/app/data/models/place_model.dart';

class PlacesListView extends GetView<PlacesListController> {
  final String name;
  const PlacesListView(this.name, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () => Get.back(),
            ),
          ),
          title: Text(
            '     Beautiful attractions',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => buildPlaceItem(),
              itemCount: 7,
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
            ),
          ]),
        ));
  }

  Widget buildPlaceItem() => InkWell(
        onTap: () => Get.toNamed(Routes.PLACE),
        child: Column(children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      blurRadius: 7.0,
                      // spreadRadius: 0.1,
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                    'assets/images/Karma-Beach-Bali-Indonesia.jpg',
                    width: 500,
                    height: 200,
                    fit: BoxFit.cover),
              ),
              Container(
                width: 370,
                height: 30,
                color: Colors.white30,
                child: Row(
                  children: [
                    SizedBox(
                      width: 110,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]),
      );
}
