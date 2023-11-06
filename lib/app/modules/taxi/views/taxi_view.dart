import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/constants.dart';
import '../../../service/api_link.dart';
import '../../taxi_info/views/taxi_info_view.dart';
import '../controllers/taxi_controller.dart';

class TaxiView extends GetView<TaxiController> {
  @override
  Widget build(BuildContext context) {
    Get.put(TaxiController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: orange,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          title: const Text('Taxi', style: TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 13.0),
          child: GestureDetector(
            onTap: () {},
            child: Obx(() {
              if (controller.isLoadin.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.taxiList.length,
                    itemBuilder: (context, index) {
                      print('this is from build');
                      print(controller.taxiList.length);
                      return InkWell(
                        onTap: () => Get.to(TaxiInfoView(
                          image: '',
                          goverment:
                              controller.taxiList[index].covernorates.name,
                          name: controller.taxiList[index].name,
                          phone: controller.taxiList[index].phoneUrl,
                          price:
                              controller.taxiList[index].pricePer1Km.toString(),
                        )),
                        child: TaxiCard(
                            name: controller.taxiList[index].name,
                            goverment:
                                controller.taxiList[index].covernorates.name,
                            image: 'controller.taxiList[index].'),
                      );
                    });
              }
            }),
          ),
        ),
      ),
    );
  }
}

class TaxiCard extends StatelessWidget {
  const TaxiCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.goverment})
      : super(key: key);
  final String image;
  final String name;
  final String goverment;

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
            Text(goverment,
                style: TextStyle(fontSize: 15, color: Colors.grey[700])),
          ],
        )
      ],
    );
  }
}
