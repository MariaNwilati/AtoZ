import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/companion_info_controller.dart';

class CompanionInfoView extends GetView<CompanionInfoController> {
  const CompanionInfoView({
  required  this.image, 
  required  this.name,
  required   this.language,
  required    this.phone,
  required     this.country,
  required      this.price,
         Key? key}) : super(key: key);



  final String image;
  final String name;
  final String language;
  final String phone;
  final String country;
  final String price;
  @override
  Widget build(BuildContext context) {
    Get.put(CompanionInfoController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffFF9114),
        elevation: 0,
        titleSpacing: 60,
        toolbarHeight: 50.0,
        title: const Text(
          "Companion Profile",
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'com',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          CustomPaint(
            painter: HeaderCurvedContainer(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            right: 135,
            top: 80,
            bottom: 700,
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 260,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              text(country: country , image:  image , language: language ,name:  name , phone:  phone , price: price),
            ]),
          ),
        ]),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffFF9114);
    Path path = Path()
      ..relativeLineTo(0, 100)
      ..quadraticBezierTo(size.width / 2, 200, size.width, 100)
      ..relativeLineTo(0, -100)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

Widget text(    {
 required String image,
 required  String name,
 required  String language,
 required  String phone,
 required  String country,
 required  String price,}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      children: [
        Row(children: [
          const Text(
            'Name:  ',
            style: TextStyle(
                color: Colors.black54,
                fontFamily: 'com',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            '$name',
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
        const SizedBox(height: 15),
        const Divider(),
        const SizedBox(height: 15),
        Row(children: [
          const Text(
            'Language:',
            style: TextStyle(
                color: Colors.black54,
                fontFamily: 'com',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            ' $language',
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
        const SizedBox(height: 15),
        const Divider(),
        const SizedBox(height: 15),
        Row(children: [
          const Text(
            'Phone: ',
            style: TextStyle(
                color: Colors.black54,
                fontFamily: 'com',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            '$phone ',
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
        const SizedBox(height: 15),
        const Divider(),
        const SizedBox(height: 15),
        Row(children: [
          const Text(
            'Country: ',
            style: TextStyle(
                color: Colors.black54,
                fontFamily: 'com',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            '$country',
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
        const SizedBox(height: 15),
        const Divider(),
        const SizedBox(height: 15),
        Row(children: [
          const Text(
            'Price per hour: ',
            style: TextStyle(
                color: Colors.black54,
                fontFamily: 'com',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(width: 10),
          Text(
            '$price',
            style: const TextStyle(
                color: Colors.black38, fontFamily: 'com', fontSize: 20),
          ),
        ]),
      ],
    ),
  );
}
