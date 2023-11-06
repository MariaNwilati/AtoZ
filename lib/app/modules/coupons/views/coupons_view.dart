import 'package:atoz/app/modules/couponitem/views/couponitem_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/coupons_controller.dart';

class CouponsView extends GetView<CouponsController> {
  const CouponsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CouponsController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xffff9114),
            onPressed: () => Get.back(),
          ),
        ),
        titleSpacing: 110,
        title: const Text(
          'Coupons',
          style: TextStyle(
            color: Color(0xffff9114),
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: controller.isLoadin.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Obx(() {
                    return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => buildCouponItem(
                          precentage:
                              controller.cuponList[index].percentage.toString(),
                          couponName: controller.cuponList[index].name,
                          expireDate:
                              controller.cuponList[index].expDate.toString(),
                          price: controller.cuponList[index].price.toString(),
                          type: controller.cuponList[index].type,
                          value: controller.cuponList[index].percentage
                              .toString()),
                      itemCount: controller.cuponList.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    );
                  }),
                ],
              ),
            )),
    );
  }

  Widget buildCouponItem(
          {required String couponName,
          required String type,
          required String value,
          required String expireDate,
          required String price,
          required String precentage}) =>
      Container(
        height: 230,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 7.0,
              // spreadRadius: 0.1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    couponName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Comfortaa',
                      // decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.discount_rounded,
                    color: Color(0xffff9114),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(children: [
              Text(
                'Type: $type',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Comfortaa',

                  // fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Value: $value ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Comfortaa',
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Expiration date: $expireDate ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Comfortaa',
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Price: $price points ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Comfortaa',
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Get.to(CouponitemView(
                    name: couponName,
                    expireDate: expireDate,
                    precentage: precentage,
                    price: price,
                    type: type,
                  )),
                  child: Text(
                    'Buy Coupon',
                    style: TextStyle(
                      color: Color(0xffff9114),
                      fontSize: 15,
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      );
}
