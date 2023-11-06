import 'package:flutter/material.dart';


import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        titleSpacing: 85,
        title: const Text(
          'Your Profile',
          style: TextStyle(
            color: Color(0xffff9114),
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: SizedBox(
                      width: 150,
                      height: 140,
                      child: ClipOval(
                        child: Image.asset('assets/images/person.jpg')
                  
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text('Laila Hreib',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Comfortaa',
                        fontSize: 20,
                      )),
                ],
              ),
              const SizedBox(
                height: 60,
              ),

              InkWell(
                onTap: () => Get.toNamed(Routes.USER_HOTELS),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: const [
                      Text(
                        'Hotels you stayed at',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 122,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),

              Row(
                children: [
                  Container(
                    height: 1.0,
                    width: 331.0,
                    color: Colors.grey,
                  ),
                ],
              ),

              //SizedBox(height: 30,),
              InkWell(
                onTap: () => Get.toNamed(Routes.USER_RESTAURANTS),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: const [
                      Text(
                        'Restaurants you went to',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 93,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(height: 15,),
              Row(
                children: [
                  Container(
                    height: 1.0,
                    width: 331.0,
                    color: Colors.grey,
                  ),
                ],
              ),

              //SizedBox(height: 30,),
              InkWell(
                onTap: () => Get.toNamed(Routes.USER_FLIGHTS),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: const [
                      Text(
                        'Flights you went on',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              //SizedBox(height: 15,),
              Row(
                children: [
                  Container(
                    height: 1.0,
                    width: 331.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),

              Row(children: const [
                //SizedBox(width: 70,),
                Text(
                  'Your points:',
                  style: TextStyle(
                    color: Color(0xffff9114),
                    fontSize: 16,
                    fontFamily: 'Comfortaa',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('15000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Comfortaa',
                    )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
