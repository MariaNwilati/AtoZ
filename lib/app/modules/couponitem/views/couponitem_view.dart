import 'package:atoz/app/data/models/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/couponitem_controller.dart';

class CouponitemView extends GetView<CouponitemController> {
  const CouponitemView(
      {required this.name,
      required this.type,
      required this.precentage,
      required this.expireDate,
      required this.price,
      Key? key})
      : super(key: key);

  final String name;
  final String type;
  final String precentage;
  final String expireDate;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color(0xffff9114),
            onPressed: () => Get.back(),
          ),
        ),
        titleSpacing: 110,
        title: Text(
          'Coupons',
          style: TextStyle(
            color: Color(0xffff9114),
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontFamily: 'Comfortaa',
                    // decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(children: [
            Text(
              'Type: $type',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Comfortaa',

                // fontWeight: FontWeight.bold,
              ),
            ),
          ]),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'Value: $precentage ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'Expiration date: $expireDate ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'Price: $price points ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You Have This Coupon!',
                style: TextStyle(
                  color: orange,
                  fontSize: 20,
                  fontFamily: 'Comfortaa',
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
